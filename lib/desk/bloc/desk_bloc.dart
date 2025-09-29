import 'package:app_logger/app_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappe_dart/src/models/desk_sidebar_items_response/desk_page.dart';
import 'package:frappify/desk/model/current_page.dart';
import 'package:frappify/login/login.dart';
import 'package:secure_storage/secure_storage.dart';

part 'desk_event.dart';
part 'desk_state.dart';

class DeskBloc extends Bloc<DeskEvent, DeskState> {
  DeskBloc({required this.frappe, required this.secureStorage})
    : super(DeskState.initial()) {
    on<LogoutEvent>(_onLogout);
    on<LoadUserDataEvent>(_onLoadUserData);
    on<LoadWorkspacesEvent>(_onLoadWorkspaces);
    on<LoadPageEvent>(_onLoadPage);
  }

  final FrappeClient frappe;
  final SecureStorage secureStorage;

  Future<void> _onLogout(LogoutEvent event, Emitter<DeskState> emit) async {
    try {
      await frappe.logout();
      await secureStorage.delete(key: 'cookie');
      await secureStorage.delete(key: 'username');
      await secureStorage.delete(key: 'userId');

      if (event.context.mounted) {
        Navigator.of(event.context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    } catch (e, stack) {
      await AppLogger.reportError(e, stack, 'Failed to logout');
    }
  }

  Future<void> _onLoadUserData(
    LoadUserDataEvent event,
    Emitter<DeskState> emit,
  ) async {
    try {
      final userId = await secureStorage.read(key: 'userId');
      final username = await secureStorage.read(key: 'username');
      emit(state.copyWith(userId: userId, username: username));
    } catch (e, stack) {
      await AppLogger.reportError(e, stack, 'Failed to load user data');
    }
  }

  Future<void> _onLoadWorkspaces(
    LoadWorkspacesEvent event,
    Emitter<DeskState> emit,
  ) async {
    try {
      final workspaces = await frappe.getDeskSideBarItems();
      emit(state.copyWith(workspaces: workspaces.message!.pages));
      if (event.workspace != null) {
        // change the workspace string to be like this, if there are - in the string convert them to space and capitalize the first letter of each word
        final workspaceId = event.workspace!
            .split('-')
            .map(
              (word) =>
                  word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
            )
            .join(' ');
        add(LoadPageEvent(name: workspaceId, type: 'Workspace'));
      } else {
        add(
          LoadPageEvent(
            name: workspaces.message!.pages![0].name!,
            type: 'Workspace',
          ),
        );
      }
    } catch (e, stack) {
      await AppLogger.reportError(e, stack, 'Failed to load workspaces');
    }
  }

  Future<void> _onLoadPage(
    LoadPageEvent event,
    Emitter<DeskState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          currentPage: CurrentPage(
            type: event.type,
            name: event.name,
          ),
        ),
      );
    } catch (e, stack) {
      await AppLogger.reportError(e, stack, 'Failed to load workspace');
    }
  }
}
