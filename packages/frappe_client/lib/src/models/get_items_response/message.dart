import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:frappe_client/src/models/get_items_response/item.dart';

class Message extends Equatable {
  const Message({this.items});

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final List<Item>? items;

  Map<String, dynamic> toMap() => {
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());

  Message copyWith({
    List<Item>? items,
  }) {
    return Message(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
