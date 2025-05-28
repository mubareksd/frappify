import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/login/login.dart';
import 'package:secure_storage/secure_storage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        secureStorage: context.read<SecureStorage>(),
        frappe: context.read<FrappeClient>(),
      ),
      child: const LoginView(),
    );
  }
}
