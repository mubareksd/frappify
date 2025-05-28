part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class CompleteOnboardingEvent extends OnboardingEvent {
  const CompleteOnboardingEvent({required this.hostAddress});

  final String hostAddress;

  @override
  List<Object?> get props => [hostAddress];
}
