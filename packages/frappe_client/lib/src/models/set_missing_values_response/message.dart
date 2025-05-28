import 'dart:convert';

import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({
    this.printFormat,
    this.campaign,
    this.allowPrintBeforePay,
  });

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        printFormat: data['print_format'] as String?,
        campaign: data['campaign'] as dynamic,
        allowPrintBeforePay: data['allow_print_before_pay'] as dynamic,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? printFormat;
  final dynamic campaign;
  final dynamic allowPrintBeforePay;

  Map<String, dynamic> toMap() => {
        'print_format': printFormat,
        'campaign': campaign,
        'allow_print_before_pay': allowPrintBeforePay,
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());

  Message copyWith({
    String? printFormat,
    dynamic campaign,
    dynamic allowPrintBeforePay,
  }) {
    return Message(
      printFormat: printFormat ?? this.printFormat,
      campaign: campaign ?? this.campaign,
      allowPrintBeforePay: allowPrintBeforePay ?? this.allowPrintBeforePay,
    );
  }

  @override
  List<Object?> get props => [printFormat, campaign, allowPrintBeforePay];
}
