import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:frappe_client/src/models/get_items_response/message.dart';

class GetItemsResponse extends Equatable {
  const GetItemsResponse({this.message});

  factory GetItemsResponse.fromMap(Map<String, dynamic> data) {
    return GetItemsResponse(
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetItemsResponse].
  factory GetItemsResponse.fromJson(String data) {
    return GetItemsResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final Message? message;

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [GetItemsResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetItemsResponse copyWith({
    Message? message,
  }) {
    return GetItemsResponse(
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [message];
}
