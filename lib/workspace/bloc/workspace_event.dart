part of 'workspace_bloc.dart';

sealed class WorkspaceEvent extends Equatable {
  const WorkspaceEvent();

  @override
  List<Object> get props => [];
}

class LoadWorkspaceEvent extends WorkspaceEvent {
  const LoadWorkspaceEvent({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}
