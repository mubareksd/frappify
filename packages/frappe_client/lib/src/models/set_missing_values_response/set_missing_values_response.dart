import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:frappe_client/src/models/pos_invoice/pos_invoice.dart';

import 'package:frappe_client/src/models/set_missing_values_response/message.dart';

class SetMissingValuesResponse extends Equatable {
  const SetMissingValuesResponse({this.docs, this.message});

  factory SetMissingValuesResponse.fromMap(Map<String, dynamic> data) {
    return SetMissingValuesResponse(
      docs: (data['docs'] as List<dynamic>?)
          ?.map((e) => PosInvoice.fromMap(e as Map<String, dynamic>))
          .toList(),
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SetMissingValuesResponse].
  factory SetMissingValuesResponse.fromJson(String data) {
    return SetMissingValuesResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  final List<PosInvoice>? docs;
  final Message? message;

  Map<String, dynamic> toMap() => {
        'docs': docs?.map((e) => e.toMap()).toList(),
        'message': message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [SetMissingValuesResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  SetMissingValuesResponse copyWith({
    List<PosInvoice>? docs,
    Message? message,
  }) {
    return SetMissingValuesResponse(
      docs: docs ?? this.docs,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [docs, message];
}
