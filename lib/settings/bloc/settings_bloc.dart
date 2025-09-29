import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:secure_storage/secure_storage.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.frappe, required this.secureStorage})
    : super(SettingsState.initial()) {
    on<ThemeChangedEvent>(_onThemeChanged);
    on<LocaleChangedEvent>(_onLocaleChanged);
  }

  final FrappeClient frappe;
  final SecureStorage secureStorage;

  Future<void> _onThemeChanged(
    ThemeChangedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onLocaleChanged(
    LocaleChangedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(locale: event.locale));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) =>
      SettingsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(SettingsState state) => state.toJson();
}
