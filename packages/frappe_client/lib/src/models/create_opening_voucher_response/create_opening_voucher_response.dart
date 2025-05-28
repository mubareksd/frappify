import 'dart:convert';

import 'package:frappe_client/src/models/create_opening_voucher_response/message.dart';

class CreateOpeningVoucherResponse {
  CreateOpeningVoucherResponse({this.message});

  factory CreateOpeningVoucherResponse.fromMap(Map<String, dynamic> data) {
    return CreateOpeningVoucherResponse(
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateOpeningVoucherResponse].
  factory CreateOpeningVoucherResponse.fromJson(String data) {
    return CreateOpeningVoucherResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  Message? message;

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [CreateOpeningVoucherResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
