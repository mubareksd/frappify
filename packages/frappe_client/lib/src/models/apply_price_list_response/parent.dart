import 'dart:convert';

class Parent {
  Parent({
    this.priceListCurrency,
    this.priceListUomDependant,
    this.plcConversionRate,
  });

  factory Parent.fromMap(Map<String, dynamic> data) => Parent(
        priceListCurrency: data['price_list_currency'] as String?,
        priceListUomDependant: data['price_list_uom_dependant'] as dynamic,
        plcConversionRate: data['plc_conversion_rate'] as int?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Parent].
  factory Parent.fromJson(String data) {
    return Parent.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? priceListCurrency;
  dynamic priceListUomDependant;
  int? plcConversionRate;

  Map<String, dynamic> toMap() => {
        'price_list_currency': priceListCurrency,
        'price_list_uom_dependant': priceListUomDependant,
        'plc_conversion_rate': plcConversionRate,
      };

  /// `dart:convert`
  ///
  /// Converts [Parent] to a JSON string.
  String toJson() => json.encode(toMap());
}
