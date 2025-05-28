import 'dart:convert';

import 'package:frappe_client/src/models/apply_price_list_request/args.dart';
import 'package:frappe_client/src/models/apply_price_list_request/doc.dart';

class ApplyPriceListRequest {
  ApplyPriceListRequest({
    required this.args,
    required this.doc,
  });

  factory ApplyPriceListRequest.fromMap(Map<String, dynamic> data) {
    return ApplyPriceListRequest(
      args: Args.fromJson(data['args'] as String),
      doc: Doc.fromJson(data['doc'] as String),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplyPriceListRequest].
  factory ApplyPriceListRequest.fromJson(String data) {
    return ApplyPriceListRequest.fromMap(
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
  /// Converts [ApplyPriceListRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
