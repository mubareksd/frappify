import 'dart:convert';

import 'package:frappe_client/src/models/pos_invoice/pos_invoice.dart';

class GetPosInvoicesResponse {
  GetPosInvoicesResponse({this.message});

  factory GetPosInvoicesResponse.fromMap(Map<String, dynamic> data) {
    return GetPosInvoicesResponse(
      message: (data['message'] as List<dynamic>?)
          ?.map((e) => PosInvoice.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetPosInvoicesResponse].
  factory GetPosInvoicesResponse.fromJson(String data) {
    return GetPosInvoicesResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  List<PosInvoice>? message;

  Map<String, dynamic> toMap() => {
        'message': message?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [GetPosInvoicesResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
