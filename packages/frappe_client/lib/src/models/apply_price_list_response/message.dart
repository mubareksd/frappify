import 'dart:convert';

import 'package:frappe_client/src/models/apply_price_list_response/parent.dart';

class Message {
  Message({this.parent});

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        parent: data['parent'] == null
            ? null
            : Parent.fromMap(data['parent'] as Map<String, dynamic>),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  Parent? parent;

  Map<String, dynamic> toMap() => {
        'parent': parent?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());
}
