part of 'desk_bloc.dart';

abstract class DeskEvent extends Equatable {
  const DeskEvent();

  @override
  List<Object?> get props => [];
}

class LogoutEvent extends DeskEvent {
  const LogoutEvent({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}

class LoadUserDataEvent extends DeskEvent {}

class LoadWorkspacesEvent extends DeskEvent {
  const LoadWorkspacesEvent({required this.workspace});

  final String? workspace;

  @override
  List<Object?> get props => [workspace];
}

class LoadPageEvent extends DeskEvent {
  const LoadPageEvent({
    required this.type,
    required this.name,
  });

  final String type;
  final String name;

  @override
  List<Object?> get props => [type, name];
}
