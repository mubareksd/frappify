import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frappe_client/frappe_client.dart';
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
    await secureStorage.write(key: 'host_address', value: event.hostAddress);
    frappe.baseUrl = event.hostAddress;
    await secureStorage.write(key: 'completedOnboarding', value: 'true');
    emit(state.copyWith(onboardingCompleted: true));
  }
}
