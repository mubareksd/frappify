part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.themeMode, required this.locale});

  factory SettingsState.fromMap(Map<String, dynamic> map) => SettingsState(
    themeMode: map['themeMode'] != null
        ? ThemeMode.values[map['themeMode'] as int]
        : ThemeMode.system,
    locale: map['locale'] != null
        ? Locale(map['locale'] as String)
        : const Locale('en'),
  );

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      SettingsState.fromMap(json);

  factory SettingsState.initial() =>
      const SettingsState(themeMode: ThemeMode.system, locale: Locale('en'));

  final ThemeMode themeMode;
  final Locale locale;

  Map<String, dynamic> toMap() => {
    'themeMode': themeMode.index,
    'locale': locale.languageCode,
  };

  Map<String, dynamic> toJson() => toMap();

  SettingsState copyWith({ThemeMode? themeMode, Locale? locale}) =>
      SettingsState(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );

  @override
  List<Object?> get props => [themeMode, locale];
}
