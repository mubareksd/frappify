part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashStartedEvent extends SplashEvent {}
