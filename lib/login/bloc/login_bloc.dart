import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappe_dart/frappe_dart.dart';
import 'package:secure_storage/secure_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.frappe,
    required this.secureStorage,
  }) : super(LoginState.initial()) {
    on<UsernameChangedEvent>(_onUsernameChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginSubmittedEvent>(_onLoginSubmitted);
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibility);
  }

  final SecureStorage secureStorage;
  FrappeClient frappe;

  void _onUsernameChanged(
    UsernameChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(_updateFormState(state, username: event.username));
  }

  void _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(_updateFormState(state, password: event.password));
  }

  LoginState _updateFormState(
    LoginState currentState, {
    String? username,
    String? password,
  }) {
    final updatedState = currentState.copyWith(
      username: username ?? currentState.username,
      password: password ?? currentState.password,
    );

    return updatedState.copyWith(
      isValid: _isFormValid(updatedState.username, updatedState.password),
    );
  }

  bool _isFormValid(String username, String password) {
    return username.isNotEmpty &&
        username.length >= 3 &&
        password.isNotEmpty &&
        password.length >= 8;
  }

  Future<void> _onLoginSubmitted(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final value = await frappe.login(
        LoginRequest(usr: state.username, pwd: state.password),
      );

      frappe.cookie = value.cookie;
      await secureStorage.write(key: 'cookie', value: value.cookie!);
      await secureStorage.write(key: 'username', value: value.fullName!);
      await secureStorage.write(
        key: 'userId',
        value: Uri.decodeComponent(value.userId!),
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch (error) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}
