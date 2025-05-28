import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/splash/splash.dart';
import 'package:secure_storage/secure_storage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(
        frappe: context.read<FrappeClient>(),
        secureStorage: context.read<SecureStorage>(),
      )..add(SplashStartedEvent()),
      child: const SplashView(),
    );
  }
}
