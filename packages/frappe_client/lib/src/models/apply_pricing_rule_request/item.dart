import 'dart:convert';

class Item {
  Item({
    this.doctype,
    this.name,
    this.childDocname,
    this.itemCode,
    this.itemGroup,
    this.brand,
    this.qty,
    this.stockQty,
    this.uom,
    this.stockUom,
    this.parenttype,
    this.parent,
    this.pricingRules,
    this.isFreeItem,
    this.warehouse,
    this.batchNo,
    this.priceListRate,
    this.conversionFactor,
    this.marginType,
    this.marginRateOrAmount,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        doctype: data['doctype'] as String?,
        name: data['name'] as String?,
        childDocname: data['child_docname'] as String?,
        itemCode: data['item_code'] as String?,
        itemGroup: data['item_group'] as String?,
        brand: data['brand'] as dynamic,
        qty: data['qty'] as int?,
        stockQty: data['stock_qty'] as int?,
        uom: data['uom'] as String?,
        stockUom: data['stock_uom'] as String?,
        parenttype: data['parenttype'] as String?,
        parent: data['parent'] as String?,
        pricingRules: data['pricing_rules'] as String?,
        isFreeItem: data['is_free_item'] as int?,
        warehouse: data['warehouse'] as String?,
        batchNo: data['batch_no'] as String?,
        priceListRate: data['price_list_rate'] as int?,
        conversionFactor: data['conversion_factor'] as int?,
        marginType: data['margin_type'] as String?,
        marginRateOrAmount: data['margin_rate_or_amount'] as int?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? doctype;
  String? name;
  String? childDocname;
  String? itemCode;
  String? itemGroup;
  dynamic brand;
  int? qty;
  int? stockQty;
  String? uom;
  String? stockUom;
  String? parenttype;
  String? parent;
  String? pricingRules;
  int? isFreeItem;
  String? warehouse;
  String? batchNo;
  int? priceListRate;
  int? conversionFactor;
  String? marginType;
  int? marginRateOrAmount;

  Map<String, dynamic> toMap() => {
        'doctype': doctype,
        'name': name,
        'child_docname': childDocname,
        'item_code': itemCode,
        'item_group': itemGroup,
        'brand': brand,
        'qty': qty,
        'stock_qty': stockQty,
        'uom': uom,
        'stock_uom': stockUom,
        'parenttype': parenttype,
        'parent': parent,
        'pricing_rules': pricingRules,
        'is_free_item': isFreeItem,
        'warehouse': warehouse,
        'batch_no': batchNo,
        'price_list_rate': priceListRate,
        'conversion_factor': conversionFactor,
        'margin_type': marginType,
        'margin_rate_or_amount': marginRateOrAmount,
      };

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
}
