import 'dart:convert';

import 'package:frappe_client/src/models/get_party_details_response/message.dart';

class GetPartyDetailsResponse {
  GetPartyDetailsResponse({this.message});

  factory GetPartyDetailsResponse.fromMap(Map<String, dynamic> data) {
    return GetPartyDetailsResponse(
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetPartyDetailsResponse].
  factory GetPartyDetailsResponse.fromJson(String data) {
    return GetPartyDetailsResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  Message? message;

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [GetPartyDetailsResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
