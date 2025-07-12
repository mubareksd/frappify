import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/utils/utils.dart';

part 'number_card_state.dart';

class NumberCardCubit extends Cubit<NumberCardState> {
  NumberCardCubit({
    required this.frappe,
  }) : super(NumberCardState.initial());

  final FrappeClient frappe;

  Future<void> loadNumberCard(String name) async {
    final numberCardDoc = await frappe.getdoc('Number Card', name);

    final filters = await getFilters(
      frappe,
      json.decode(numberCardDoc.docs![0].filtersJson!),
      numberCardDoc.docs![0].dynamicFiltersJson != null
          ? json.decode(numberCardDoc.docs![0].dynamicFiltersJson as String)
          : null,
    );

    final numberCardValue = await frappe.getNumberCard(
      numberCardDoc.docs![0].toJson(),
      json.encode(filters),
    );

    final percentageResponse = await frappe.getNumberCardPercentageDifference(
      numberCardDoc.docs![0].toJson(),
      json.encode(filters),
      numberCardValue.message.toString(),
    );

    emit(
      state.copyWith(
        id: name,
        title: name,
        value: numberCardValue.message.toString(),
        showPercentage: numberCardDoc.docs![0].showPercentageStats == 1,
        percent: percentageResponse.message?.toInt().toString() ?? '0',
      ),
    );
  }
}
