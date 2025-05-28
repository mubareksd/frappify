import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/onboarding/onboarding.dart';
import 'package:secure_storage/secure_storage.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(
        secureStorage: context.read<SecureStorage>(),
        frappe: context.read<FrappeClient>(),
      ),
      child: const OnboardingView(),
    );
  }
}
