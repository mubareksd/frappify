part of 'splash_bloc.dart';

enum NavigationTarget { loginPage, deskPage, onboardingPage }

class SplashState extends Equatable {
  const SplashState({this.navigationTarget});

  factory SplashState.initial() => const SplashState();

  final NavigationTarget? navigationTarget;

  SplashState copyWith({NavigationTarget? navigationTarget}) {
    return SplashState(
      navigationTarget: navigationTarget ?? this.navigationTarget,
    );
  }

  @override
  List<Object?> get props => [navigationTarget];
}
