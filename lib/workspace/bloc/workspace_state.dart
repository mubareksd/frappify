part of 'workspace_bloc.dart';

class WorkspaceState extends Equatable {
  const WorkspaceState({
    required this.isLoadingWorkspace,
    this.workspace,
  });

  // initial state with default values
  factory WorkspaceState.initial() => const WorkspaceState(
    isLoadingWorkspace: false,
  );

  final Message? workspace;
  final bool isLoadingWorkspace;

  WorkspaceState copyWith({
    Message? workspace,
    bool? isLoadingWorkspace,
  }) => WorkspaceState(
    workspace: workspace ?? this.workspace,
    isLoadingWorkspace: isLoadingWorkspace ?? this.isLoadingWorkspace,
  );

  @override
  List<Object?> get props => [
    workspace,
    isLoadingWorkspace,
  ];
}
