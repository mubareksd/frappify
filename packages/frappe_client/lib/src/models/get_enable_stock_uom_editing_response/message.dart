import 'dart:convert';

class Message {
  Message({
    this.allowToEditStockUomQtyForSales,
    this.allowToEditStockUomQtyForPurchase,
  });

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        allowToEditStockUomQtyForSales:
            data['allow_to_edit_stock_uom_qty_for_sales'] as int?,
        allowToEditStockUomQtyForPurchase:
            data['allow_to_edit_stock_uom_qty_for_purchase'] as int?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  int? allowToEditStockUomQtyForSales;
  int? allowToEditStockUomQtyForPurchase;

  Map<String, dynamic> toMap() => {
        'allow_to_edit_stock_uom_qty_for_sales': allowToEditStockUomQtyForSales,
        'allow_to_edit_stock_uom_qty_for_purchase':
            allowToEditStockUomQtyForPurchase,
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());
}
