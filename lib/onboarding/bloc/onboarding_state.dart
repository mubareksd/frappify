part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  const OnboardingState({required this.onboardingCompleted});

  factory OnboardingState.initial() =>
      const OnboardingState(onboardingCompleted: false);

  final bool onboardingCompleted;

  OnboardingState copyWith({bool? onboardingCompleted}) {
    return OnboardingState(
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }

  @override
  List<Object?> get props => [onboardingCompleted];
}
