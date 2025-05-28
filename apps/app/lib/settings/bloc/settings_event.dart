part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class ThemeChangedEvent extends SettingsEvent {
  const ThemeChangedEvent({required this.themeMode});

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

class LocaleChangedEvent extends SettingsEvent {
  const LocaleChangedEvent({required this.locale});

  final Locale locale;
}
