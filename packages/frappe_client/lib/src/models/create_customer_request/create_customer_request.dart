import 'dart:convert';

import 'package:frappe_client/src/models/create_customer_request/doc.dart';

class CreateCustomerRequest {
  CreateCustomerRequest({this.doc});

  factory CreateCustomerRequest.fromMap(Map<String, dynamic> data) {
    return CreateCustomerRequest(
      doc: data['doc'] == null
          ? null
          : Doc.fromMap(data['doc'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateCustomerRequest].
  factory CreateCustomerRequest.fromJson(String data) {
    return CreateCustomerRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  Doc? doc;

  Map<String, dynamic> toMap() => {
        'doc': doc?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [CreateCustomerRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
