import 'dart:convert';

import 'package:frappe_client/src/models/get_enable_stock_uom_editing_response/message.dart';

class GetEnableStockUomEditingResponse {
  GetEnableStockUomEditingResponse({this.message});

  factory GetEnableStockUomEditingResponse.fromMap(Map<String, dynamic> data) {
    return GetEnableStockUomEditingResponse(
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetEnableStockUomEditingResponse].
  factory GetEnableStockUomEditingResponse.fromJson(String data) {
    return GetEnableStockUomEditingResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  Message? message;

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [GetEnableStockUomEditingResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
