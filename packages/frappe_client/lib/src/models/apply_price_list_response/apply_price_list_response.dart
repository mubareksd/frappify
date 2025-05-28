import 'dart:convert';

import 'package:frappe_client/src/models/apply_price_list_response/message.dart';

class ApplyPriceListResponse {
  ApplyPriceListResponse({this.message});

  factory ApplyPriceListResponse.fromMap(Map<String, dynamic> data) {
    return ApplyPriceListResponse(
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplyPriceListResponse].
  factory ApplyPriceListResponse.fromJson(String data) {
    return ApplyPriceListResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  Message? message;

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [ApplyPriceListResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
