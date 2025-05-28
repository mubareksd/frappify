import 'dart:convert';

class Args {
  Args({
    this.items,
    this.currency,
    this.conversionRate,
    this.priceList,
    this.priceListCurrency,
    this.plcConversionRate,
    this.company,
    this.transactionDate,
    this.campaign,
    this.ignorePricingRule,
    this.doctype,
    this.name,
    this.isReturn,
    this.updateStock,
    this.posProfile,
  });

  factory Args.fromMap(Map<String, dynamic> data) => Args(
        items: data['items'] as List<dynamic>?,
        currency: data['currency'] as String?,
        conversionRate: data['conversion_rate'] as int?,
        priceList: data['price_list'] as String?,
        priceListCurrency: data['price_list_currency'] as String?,
        plcConversionRate: data['plc_conversion_rate'] as String?,
        company: data['company'] as String?,
        transactionDate: data['transaction_date'] as String?,
        campaign: data['campaign'] as dynamic,
        ignorePricingRule: data['ignore_pricing_rule'] as int?,
        doctype: data['doctype'] as String?,
        name: data['name'] as String?,
        isReturn: data['is_return'] as int?,
        updateStock: data['update_stock'] as int?,
        posProfile: data['pos_profile'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Args].
  factory Args.fromJson(String data) {
    return Args.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  List<dynamic>? items;
  String? currency;
  int? conversionRate;
  String? priceList;
  String? priceListCurrency;
  String? plcConversionRate;
  String? company;
  String? transactionDate;
  dynamic campaign;
  int? ignorePricingRule;
  String? doctype;
  String? name;
  int? isReturn;
  int? updateStock;
  String? posProfile;

  Map<String, dynamic> toMap() => {
        'items': items,
        'currency': currency,
        'conversion_rate': conversionRate,
        'price_list': priceList,
        'price_list_currency': priceListCurrency,
        'plc_conversion_rate': plcConversionRate,
        'company': company,
        'transaction_date': transactionDate,
        'campaign': campaign,
        'ignore_pricing_rule': ignorePricingRule,
        'doctype': doctype,
        'name': name,
        'is_return': isReturn,
        'update_stock': updateStock,
        'pos_profile': posProfile,
      };

  /// `dart:convert`
  ///
  /// Converts [Args] to a JSON string.
  String toJson() => json.encode(toMap());
}
