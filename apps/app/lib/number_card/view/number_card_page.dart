import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/number_card/number_card.dart';

class NumberCardPage extends StatelessWidget {
  const NumberCardPage({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NumberCardCubit(
        frappe: context.read<FrappeClient>(),
      )..loadNumberCard(name),
      child: const NumberCardView(),
    );
  }
}
