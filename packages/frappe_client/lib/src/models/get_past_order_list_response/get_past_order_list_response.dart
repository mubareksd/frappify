import 'dart:convert';

import 'package:frappe_client/src/models/get_past_order_list_response/past_order.dart';

class GetPastOrderListResponse {
  GetPastOrderListResponse({
    this.message,
  });

  factory GetPastOrderListResponse.fromMap(Map<String, dynamic> data) {
    return GetPastOrderListResponse(
      message: (data['message'] as List<dynamic>?)
          ?.map((e) => PastOrder.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetPastOrderListResponse].
  factory GetPastOrderListResponse.fromJson(String data) {
    return GetPastOrderListResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  List<PastOrder>? message;

  Map<String, dynamic> toMap() => {
        'message': message?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [GetPastOrderListResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
