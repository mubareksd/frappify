import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetStockAvailabilityResponse extends Equatable {
  const GetStockAvailabilityResponse({
    required this.stock,
    required this.isStockItem,
  });

  factory GetStockAvailabilityResponse.fromMap(Map<String, dynamic> data) {
    return GetStockAvailabilityResponse(
      stock: (data['message'][0] as num).toDouble(),
      isStockItem: data['message'][1] as bool,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetStockAvailabilityResponse].
  factory GetStockAvailabilityResponse.fromJson(String data) {
    return GetStockAvailabilityResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toMap() => {
        'stock': stock,
        'is_stock_item': isStockItem,
      };

  String toJson() => json.encode(toMap());

  final double stock;
  final bool isStockItem;

  @override
  List<Object?> get props => [
        stock,
        isStockItem,
      ];
}
