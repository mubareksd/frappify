import 'package:app_logger/app_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappe_dart/src/models/desktop_page_request.dart';
import 'package:frappe_dart/src/models/desktop_page_response/message.dart';

part 'workspace_event.dart';
part 'workspace_state.dart';

class WorkspaceBloc extends Bloc<WorkspaceEvent, WorkspaceState> {
  WorkspaceBloc({
    required this.frappe,
  }) : super(WorkspaceState.initial()) {
    on<LoadWorkspaceEvent>(_onLoadWorkspace);
  }

  final FrappeClient frappe;

  Future<void> _onLoadWorkspace(
    LoadWorkspaceEvent event,
    Emitter<WorkspaceState> emit,
  ) async {
    try {
      // Set loading state to true
      emit(state.copyWith(isLoadingWorkspace: true));

      final workspace = await frappe.getDesktopPage(
        DesktopPageRequest(name: event.name),
      );

      emit(
        state.copyWith(
          workspace: workspace.message,
          isLoadingWorkspace: false,
        ),
      );
    } catch (e, stack) {
      // Set loading state to false on error
      emit(state.copyWith(isLoadingWorkspace: false));
      await AppLogger.reportError(e, stack, 'Failed to load workspace');
    }
  }
}
