import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/l10n/l10n.dart';
import 'package:frappify/settings/settings.dart';
import 'package:frappify/splash/splash.dart';
import 'package:frappify/utils/utils.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatelessWidget {
  const App({
    required FrappeClient frappe,
    required PersistentStorage persistentStorage,
    required SecureStorage secureStorage,
    super.key,
  }) : _frappe = frappe,
       _persistentStorage = persistentStorage,
       _secureStorage = secureStorage;

  final FrappeClient _frappe;
  final PersistentStorage _persistentStorage;
  final SecureStorage _secureStorage;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _frappe),
        RepositoryProvider.value(value: _persistentStorage),
        RepositoryProvider.value(value: _secureStorage),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) =>
                SettingsBloc(frappe: _frappe, secureStorage: _secureStorage),
          ),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return ShadApp(
              scrollBehavior: MouseScrollBehavior(),
              theme: const AppTheme().themeData,
              darkTheme: const AppDarkTheme().themeData,
              themeMode: state.themeMode,
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const SplashPage(),
            );
          },
        ),
      ),
    );
  }
}
