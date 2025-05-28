import 'dart:convert';

import 'package:frappe_client/src/models/apply_pricing_rule_response/message.dart';

class ApplyPricingRuleResponse {
  ApplyPricingRuleResponse({this.message});

  factory ApplyPricingRuleResponse.fromMap(Map<String, dynamic> data) {
    return ApplyPricingRuleResponse(
      message: (data['message'] as List<dynamic>?)
          ?.map((e) => Message.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplyPricingRuleResponse].
  factory ApplyPricingRuleResponse.fromJson(String data) {
    return ApplyPricingRuleResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  List<Message>? message;

  Map<String, dynamic> toMap() => {
        'message': message?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [ApplyPricingRuleResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
