import 'dart:convert';

import 'package:frappe_client/src/models/create_customer_response/message.dart';

class CreateCustomerResponse {
  CreateCustomerResponse({this.message, this.serverMessages});

  factory CreateCustomerResponse.fromMap(Map<String, dynamic> data) {
    return CreateCustomerResponse(
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
      serverMessages: data['_server_messages'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateCustomerResponse].
  factory CreateCustomerResponse.fromJson(String data) {
    return CreateCustomerResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  Message? message;
  String? serverMessages;

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
        '_server_messages': serverMessages,
      };

  /// `dart:convert`
  ///
  /// Converts [CreateCustomerResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
