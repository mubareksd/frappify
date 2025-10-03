import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/services/toast_service.dart';
import 'package:secure_storage/secure_storage.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({
    required this.frappe,
    required this.secureStorage,
  }) : super(OnboardingState.initial()) {
    on<CompleteOnboardingEvent>(_onCompleteOnboardingEvent);
  }

  final SecureStorage secureStorage;
  final FrappeClient frappe;
  final List<Locale> lang = [
    const Locale('en'),
    const Locale('ar'),
  ];

  Future<void> _onCompleteOnboardingEvent(
    CompleteOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    final originalAddress = await secureStorage.read(key: 'host_address');
    final oldBaseUrl = frappe.baseUrl;
    emit(state.copyWith(isLoading: true));
    try {
      frappe.baseUrl = event.hostAddress;

      final pingResponse = await frappe.ping();

      await secureStorage.write(key: 'host_address', value: event.hostAddress);
      await secureStorage.write(key: 'completedOnboarding', value: 'true');
      emit(
        state.copyWith(
          onboardingCompleted: true,
          isLoading: false,
        ),
      );

      ToastService.showSuccessToast(
        message: 'Onboarding completed and server is reachable.',
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      ToastService.showErrorToast(
        message: 'Failed to reach the host address: ${e.toString()}',
      );
    }
  }
}
