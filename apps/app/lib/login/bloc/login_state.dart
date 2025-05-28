part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    required this.username,
    required this.password,
    required this.isValid,
    required this.status,
    required this.showPassword,
  });

  factory LoginState.initial() => const LoginState(
    username: '',
    password: '',
    isValid: false,
    status: LoginStatus.initial,
    showPassword: false,
  );

  final String username;
  final String password;
  final bool isValid;
  final LoginStatus status;
  final bool showPassword;

  LoginState copyWith({
    String? username,
    String? password,
    bool? isValid,
    LoginStatus? status,
    bool? showPassword,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [
    username,
    password,
    isValid,
    status,
    showPassword,
  ];
}
