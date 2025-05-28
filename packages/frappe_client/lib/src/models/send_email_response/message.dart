import 'dart:convert';

import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({this.name, this.emailsNotSentTo});

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        name: data['name'] as String?,
        emailsNotSentTo: data['emails_not_sent_to'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final String? emailsNotSentTo;

  Map<String, dynamic> toMap() => {
        'name': name,
        'emails_not_sent_to': emailsNotSentTo,
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());

  Message copyWith({
    String? name,
    String? emailsNotSentTo,
  }) {
    return Message(
      name: name ?? this.name,
      emailsNotSentTo: emailsNotSentTo ?? this.emailsNotSentTo,
    );
  }

  @override
  List<Object?> get props => [name, emailsNotSentTo];
}
