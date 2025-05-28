import 'dart:convert';

import 'package:frappe_client/src/models/apply_pricing_rule_request/args.dart';
import 'package:frappe_client/src/models/apply_pricing_rule_request/doc.dart';

class ApplyPricingRuleRequest {
  ApplyPricingRuleRequest({
    required this.args,
    required this.doc,
  });

  factory ApplyPricingRuleRequest.fromMap(Map<String, dynamic> data) {
    return ApplyPricingRuleRequest(
      args: Args.fromJson(data['atgs'] as String),
      doc: Doc.fromJson(data['doc'] as String),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplyPricingRuleRequest].
  factory ApplyPricingRuleRequest.fromJson(String data) {
    return ApplyPricingRuleRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  Args args;
  Doc doc;

  Map<String, dynamic> toMap() => {
        'args': args.toJson(),
        'doc': doc.toJson(),
      };

  /// `dart:convert`
  ///
  /// Converts [ApplyPricingRuleRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
