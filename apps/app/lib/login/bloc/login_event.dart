part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class UsernameChangedEvent extends LoginEvent {
  const UsernameChangedEvent(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class PasswordChangedEvent extends LoginEvent {
  const PasswordChangedEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmittedEvent extends LoginEvent {
  const LoginSubmittedEvent();
}

class TogglePasswordVisibilityEvent extends LoginEvent {
  const TogglePasswordVisibilityEvent();
}
