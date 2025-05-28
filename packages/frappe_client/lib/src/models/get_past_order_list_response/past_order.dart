import 'dart:convert';

class PastOrder {
  PastOrder({
    this.name,
    this.grandTotal,
    this.currency,
    this.customer,
    this.postingTime,
    this.postingDate,
    this.customFiscalNo,
    this.customMrc,
  });

  factory PastOrder.fromMap(Map<String, dynamic> data) => PastOrder(
        name: data['name'] as String?,
        grandTotal: data['grand_total'] as double?,
        currency: data['currency'] as String?,
        customer: data['customer'] as String?,
        postingTime: data['posting_time'] as String?,
        postingDate: data['posting_date'] as String?,
        customFiscalNo: data['custom_fiscal_no'] as String?,
        customMrc: data['custom_mrc'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PastOrder].
  factory PastOrder.fromJson(String data) {
    return PastOrder.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? name;
  double? grandTotal;
  String? currency;
  String? customer;
  String? postingTime;
  String? postingDate;
  String? customFiscalNo;
  String? customMrc;

  Map<String, dynamic> toMap() => {
        'name': name,
        'grand_total': grandTotal,
        'currency': currency,
        'customer': customer,
        'posting_time': postingTime,
        'posting_date': postingDate,
        'custom_fiscal_no': customFiscalNo,
        'custom_mrc': customMrc,
      };

  /// `dart:convert`
  ///
  /// Converts [PastOrder] to a JSON string.
  String toJson() => json.encode(toMap());
}
