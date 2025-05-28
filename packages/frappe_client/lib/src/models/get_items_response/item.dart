import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  const Item({
    this.itemCode,
    this.itemName,
    this.description,
    this.stockUom,
    this.itemImage,
    this.isStockItem,
    this.brand,
    this.itemGroup,
    this.hasSerialNo,
    this.hasBatchNo,
    this.isFixedAsset,
    this.assetCategory,
    this.minOrderQty,
    this.lastPurchaseRate,
    this.weightPerUnit,
    this.weightUom,
    this.deliveredBySupplier,
    this.bomNo,
    this.manufacturer,
    this.manufacturerPartNo,
    this.customPlu,
    this.qty,
    this.amount,
    this.itemTaxTemplate,
    this.itemTaxRate,
    this.actualQty,
    this.projectedQty,
    this.reservedQty,
    this.mustBeWholeNumber,
    this.warehouse,
    this.discountPercentage,
    this.baseAmount,
    this.discountAmount,
    this.netAmount,
    this.basePriceListRate,
    this.conversionFactor,
    this.stockQty,
    this.updateStock,
    this.customerItemCode,
    this.hasMargin,
    this.freeItemData,
    this.transactionDate,
    this.againstBlanketOrder,
    this.incomeAccount,
    this.expenseAccount,
    this.discountAccount,
    this.provisionalExpenseAccount,
    this.costCenter,
    this.uom,
    this.priceListRate,
    this.rate,
    this.netRate,
    this.currency,
    this.batchNo,
    this.grantCommission,
    this.barcode,
    this.allowNegativeStock,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        itemCode: data['item_code'] as String?,
        itemName: data['item_name'] as String?,
        description: data['description'] as String?,
        stockUom: data['stock_uom'] as String?,
        itemImage: data['item_image'] as String?,
        isStockItem: data['is_stock_item'] as int?,
        brand: data['brand'] as String?,
        itemGroup: data['item_group'] as String?,
        hasSerialNo: data['has_serial_no'] as int?,
        hasBatchNo: data['has_batch_no'] as int?,
        isFixedAsset: data['is_fixed_asset'] as int?,
        assetCategory: data['asset_category'] as String?,
        minOrderQty: data['min_order_qty'] != null
            ? (data['min_order_qty'] as num).toDouble()
            : 0.0,
        lastPurchaseRate: data['last_purchase_rate'] != null
            ? (data['last_purchase_rate'] as num).toDouble()
            : 0.0,
        weightPerUnit: data['weight_per_unit'] != null
            ? (data['weight_per_unit'] as num).toDouble()
            : 0.0,
        weightUom: data['weight_uom'] as String?,
        deliveredBySupplier: data['delivered_by_supplier'] as int?,
        bomNo: data['bom_no'] as String?,
        manufacturer: data['manufacturer'] as String?,
        manufacturerPartNo: data['manufacturer_part_no'] as String?,
        customPlu: data['custom_plu'] as int?,
        qty: data['qty'] != null ? (data['qty'] as num).toDouble() : 0.0,
        amount:
            data['amount'] != null ? (data['amount'] as num).toDouble() : 0.0,
        itemTaxTemplate: data['item_tax_template'] as String?,
        itemTaxRate: data['item_tax_rate'] as String?,
        actualQty: data['actual_qty'] != null
            ? (data['actual_qty'] as num).toDouble()
            : 0.0,
        projectedQty: data['projected_qty'] != null
            ? (data['projected_qty'] as num).toDouble()
            : 0.0,
        reservedQty: data['reserved_qty'] != null
            ? (data['reserved_qty'] as num).toDouble()
            : 0.0,
        mustBeWholeNumber: data['must_be_whole_number'] as int?,
        warehouse: data['warehouse'] as String?,
        discountPercentage: data['discount_percentage'] != null
            ? (data['discount_percentage'] as num).toDouble()
            : 0.0,
        baseAmount: data['base_amount'] != null
            ? (data['base_amount'] as num).toDouble()
            : 0.0,
        discountAmount: data['discount_amount'] != null
            ? (data['discount_amount'] as num).toDouble()
            : 0.0,
        netAmount: data['net_amount'] != null
            ? (data['net_amount'] as num).toDouble()
            : 0.0,
        basePriceListRate: data['base_price_list_rate'] != null
            ? (data['base_price_list_rate'] as num).toDouble()
            : 0.0,
        conversionFactor: data['conversion_factor'] != null
            ? (data['conversion_factor'] as num).toDouble()
            : 0.0,
        stockQty: data['stock_qty'] != null
            ? (data['stock_qty'] as num).toDouble()
            : 0.0,
        updateStock: data['update_stock'] as int?,
        customerItemCode: data['customer_item_code'] as String?,
        hasMargin: data['has_margin'] as bool?,
        freeItemData: data['free_item_data'] as List<dynamic>?,
        transactionDate: data['transaction_date'] as String?,
        againstBlanketOrder: data['against_blanket_order'] as String?,
        incomeAccount: data['income_account'] as String?,
        expenseAccount: data['expense_account'] as String?,
        discountAccount: data['discount_account'] as String?,
        provisionalExpenseAccount:
            data['provisional_expense_account'] as String?,
        costCenter: data['cost_center'] as String?,
        uom: data['uom'] as String?,
        priceListRate: data['price_list_rate'] != null
            ? (data['price_list_rate'] as num?)?.toDouble()
            : 0.0,
        rate: data['rate'] != null ? (data['rate'] as num?)?.toDouble() : 0.0,
        netRate: data['net_rate'] != null
            ? (data['net_rate'] as num?)?.toDouble()
            : 0.0,
        currency: data['currency'] as String?,
        batchNo: data['batch_no'] as String?,
        grantCommission: data['grant_commission'] as int?,
        barcode: data['barcode'] as String?,
        allowNegativeStock: data['allow_negative_stock'] as int?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? itemCode;
  final String? itemName;
  final String? description;
  final String? stockUom;
  final String? itemImage;
  final int? isStockItem;
  final String? brand;
  final String? itemGroup;
  final int? hasSerialNo;
  final int? hasBatchNo;
  final int? isFixedAsset;
  final String? assetCategory;
  final double? minOrderQty;
  final double? lastPurchaseRate;
  final double? weightPerUnit;
  final String? weightUom;
  final int? deliveredBySupplier;
  final String? bomNo;
  final String? manufacturer;
  final String? manufacturerPartNo;
  final int? customPlu;
  final double? qty;
  final double? amount;
  final String? itemTaxTemplate;
  final String? itemTaxRate;
  final double? actualQty;
  final double? projectedQty;
  final double? reservedQty;
  final int? mustBeWholeNumber;
  final String? warehouse;
  final double? discountPercentage;
  final double? baseAmount;
  final double? discountAmount;
  final double? netAmount;
  final double? basePriceListRate;
  final double? conversionFactor;
  final double? stockQty;
  final int? updateStock;
  final String? customerItemCode;
  final bool? hasMargin;
  final List<dynamic>? freeItemData;
  final String? transactionDate;
  final String? againstBlanketOrder;
  final String? incomeAccount;
  final String? expenseAccount;
  final String? discountAccount;
  final String? provisionalExpenseAccount;
  final String? costCenter;
  final String? uom;
  final double? priceListRate;
  final double? rate;
  final double? netRate;
  final String? currency;
  final dynamic batchNo;
  final int? grantCommission;
  final String? barcode;
  final int? allowNegativeStock;
  Map<String, dynamic> toMap() => {
        'item_code': itemCode,
        'item_name': itemName,
        'description': description,
        'stock_uom': stockUom,
        'item_image': itemImage,
        'is_stock_item': isStockItem,
        'brand': brand,
        'item_group': itemGroup,
        'has_serial_no': hasSerialNo,
        'has_batch_no': hasBatchNo,
        'is_fixed_asset': isFixedAsset,
        'asset_category': assetCategory,
        'min_order_qty': minOrderQty,
        'last_purchase_rate': lastPurchaseRate,
        'weight_per_unit': weightPerUnit,
        'weight_uom': weightUom,
        'delivered_by_supplier': deliveredBySupplier,
        'bom_no': bomNo,
        'manufacturer': manufacturer,
        'manufacturer_part_no': manufacturerPartNo,
        'custom_plu': customPlu,
        'qty': qty,
        'amount': amount,
        'item_tax_template': itemTaxTemplate,
        'item_tax_rate': itemTaxRate,
        'actual_qty': actualQty,
        'projected_qty': projectedQty,
        'reserved_qty': reservedQty,
        'must_be_whole_number': mustBeWholeNumber,
        'warehouse': warehouse,
        'discount_percentage': discountPercentage,
        'base_amount': baseAmount,
        'discount_amount': discountAmount,
        'net_amount': netAmount,
        'base_price_list_rate': basePriceListRate,
        'conversion_factor': conversionFactor,
        'stock_qty': stockQty,
        'update_stock': updateStock,
        'customer_item_code': customerItemCode,
        'has_margin': hasMargin,
        'free_item_data': freeItemData,
        'transaction_date': transactionDate,
        'against_blanket_order': againstBlanketOrder,
        'income_account': incomeAccount,
        'expense_account': expenseAccount,
        'discount_account': discountAccount,
        'provisional_expense_account': provisionalExpenseAccount,
        'cost_center': costCenter,
        'uom': uom,
        'price_list_rate': priceListRate,
        'rate': rate,
        'net_rate': netRate,
        'currency': currency,
        'batch_no': batchNo,
        'grant_commission': grantCommission,
        'barcode': barcode,
        'allow_negative_stock': allowNegativeStock,
      };

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  Item copyWith({
    String? itemCode,
    String? itemName,
    String? description,
    String? stockUom,
    String? itemImage,
    int? isStockItem,
    String? brand,
    String? itemGroup,
    int? hasSerialNo,
    int? hasBatchNo,
    int? isFixedAsset,
    String? assetCategory,
    double? minOrderQty,
    double? lastPurchaseRate,
    double? weightPerUnit,
    String? weightUom,
    int? deliveredBySupplier,
    String? bomNo,
    String? manufacturer,
    String? manufacturerPartNo,
    int? customPlu,
    double? qty,
    double? amount,
    String? itemTaxTemplate,
    String? itemTaxRate,
    double? actualQty,
    double? projectedQty,
    double? reservedQty,
    int? mustBeWholeNumber,
    String? warehouse,
    double? discountPercentage,
    double? baseAmount,
    double? discountAmount,
    double? netAmount,
    double? basePriceListRate,
    double? conversionFactor,
    double? stockQty,
    int? updateStock,
    String? customerItemCode,
    bool? hasMargin,
    List<dynamic>? freeItemData,
    String? transactionDate,
    String? againstBlanketOrder,
    String? incomeAccount,
    String? expenseAccount,
    String? discountAccount,
    String? provisionalExpenseAccount,
    String? costCenter,
    String? uom,
    double? priceListRate,
    double? rate,
    double? netRate,
    String? currency,
    String? batchNo,
    int? grantCommission,
    String? barcode,
    int? allowNegativeStock,
  }) {
    return Item(
      itemCode: itemCode ?? this.itemCode,
      itemName: itemName ?? this.itemName,
      description: description ?? this.description,
      stockUom: stockUom ?? this.stockUom,
      itemImage: itemImage ?? this.itemImage,
      isStockItem: isStockItem ?? this.isStockItem,
      brand: brand ?? this.brand,
      itemGroup: itemGroup ?? this.itemGroup,
      hasSerialNo: hasSerialNo ?? this.hasSerialNo,
      hasBatchNo: hasBatchNo ?? this.hasBatchNo,
      isFixedAsset: isFixedAsset ?? this.isFixedAsset,
      assetCategory: assetCategory ?? this.assetCategory,
      minOrderQty: minOrderQty ?? this.minOrderQty,
      lastPurchaseRate: lastPurchaseRate ?? this.lastPurchaseRate,
      weightPerUnit: weightPerUnit ?? this.weightPerUnit,
      weightUom: weightUom ?? this.weightUom,
      deliveredBySupplier: deliveredBySupplier ?? this.deliveredBySupplier,
      bomNo: bomNo ?? this.bomNo,
      manufacturer: manufacturer ?? this.manufacturer,
      manufacturerPartNo: manufacturerPartNo ?? this.manufacturerPartNo,
      customPlu: customPlu ?? this.customPlu,
      qty: qty ?? this.qty,
      amount: amount ?? this.amount,
      itemTaxTemplate: itemTaxTemplate ?? this.itemTaxTemplate,
      itemTaxRate: itemTaxRate ?? this.itemTaxRate,
      actualQty: actualQty ?? this.actualQty,
      projectedQty: projectedQty ?? this.projectedQty,
      reservedQty: reservedQty ?? this.reservedQty,
      mustBeWholeNumber: mustBeWholeNumber ?? this.mustBeWholeNumber,
      warehouse: warehouse ?? this.warehouse,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      baseAmount: baseAmount ?? this.baseAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      netAmount: netAmount ?? this.netAmount,
      basePriceListRate: basePriceListRate ?? this.basePriceListRate,
      conversionFactor: conversionFactor ?? this.conversionFactor,
      stockQty: stockQty ?? this.stockQty,
      updateStock: updateStock ?? this.updateStock,
      customerItemCode: customerItemCode ?? this.customerItemCode,
      hasMargin: hasMargin ?? this.hasMargin,
      freeItemData: freeItemData ?? this.freeItemData,
      transactionDate: transactionDate ?? this.transactionDate,
      againstBlanketOrder: againstBlanketOrder ?? this.againstBlanketOrder,
      incomeAccount: incomeAccount ?? this.incomeAccount,
      expenseAccount: expenseAccount ?? this.expenseAccount,
      discountAccount: discountAccount ?? this.discountAccount,
      provisionalExpenseAccount:
          provisionalExpenseAccount ?? this.provisionalExpenseAccount,
      costCenter: costCenter ?? this.costCenter,
      uom: uom ?? this.uom,
      priceListRate: priceListRate ?? this.priceListRate,
      rate: rate ?? this.rate,
      netRate: netRate ?? this.netRate,
      currency: currency ?? this.currency,
      batchNo: batchNo ?? this.batchNo,
      grantCommission: grantCommission ?? this.grantCommission,
      barcode: barcode ?? this.barcode,
      allowNegativeStock: allowNegativeStock ?? this.allowNegativeStock,
    );
  }

  @override
  List<Object?> get props {
    return [
      itemCode,
      itemName,
      description,
      stockUom,
      itemImage,
      isStockItem,
      brand,
      itemGroup,
      hasSerialNo,
      hasBatchNo,
      isFixedAsset,
      assetCategory,
      minOrderQty,
      lastPurchaseRate,
      weightPerUnit,
      weightUom,
      deliveredBySupplier,
      bomNo,
      manufacturer,
      manufacturerPartNo,
      customPlu,
      qty,
      amount,
      itemTaxTemplate,
      itemTaxRate,
      actualQty,
      projectedQty,
      reservedQty,
      mustBeWholeNumber,
      warehouse,
      discountPercentage,
      baseAmount,
      discountAmount,
      netAmount,
      basePriceListRate,
      conversionFactor,
      stockQty,
      updateStock,
      customerItemCode,
      hasMargin,
      freeItemData,
      transactionDate,
      againstBlanketOrder,
      incomeAccount,
      expenseAccount,
      discountAccount,
      provisionalExpenseAccount,
      costCenter,
      uom,
      priceListRate,
      rate,
      netRate,
      currency,
      batchNo,
      grantCommission,
      barcode,
      allowNegativeStock,
    ];
  }
}
