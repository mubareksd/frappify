part of 'desk_bloc.dart';

class DeskState extends Equatable {
  const DeskState({
    this.userId,
    this.username,
    this.workspaces,
    this.currentPage,
    this.isLoadingWorkspace = false,
  });

  factory DeskState.initial() => const DeskState();

  final String? userId;
  final String? username;
  final List<DeskPage>? workspaces;
  final bool isLoadingWorkspace;
  final CurrentPage? currentPage;

  DeskState copyWith({
    String? userId,
    String? username,
    List<DeskPage>? workspaces,
    CurrentPage? currentPage,
    bool? isLoadingWorkspace,
  }) => DeskState(
    userId: userId ?? this.userId,
    username: username ?? this.username,
    workspaces: workspaces ?? this.workspaces,
    isLoadingWorkspace: isLoadingWorkspace ?? this.isLoadingWorkspace,
    currentPage: currentPage ?? this.currentPage,
  );
  @override
  List<Object?> get props => [
    userId,
    username,
    workspaces,
    isLoadingWorkspace,
    currentPage,
  ];
}
