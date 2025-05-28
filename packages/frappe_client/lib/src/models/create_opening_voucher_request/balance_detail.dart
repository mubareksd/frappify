import 'dart:convert';

class BalanceDetail {
  BalanceDetail({
    this.modeOfPayment,
    this.openingAmount,
    this.idx,
    this.name,
  });

  factory BalanceDetail.fromMap(Map<String, dynamic> data) => BalanceDetail(
        modeOfPayment: data['mode_of_payment'] as String?,
        openingAmount: data['opening_amount'] as String?,
        idx: data['idx'] as int?,
        name: data['name'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BalanceDetail].
  factory BalanceDetail.fromJson(String data) {
    return BalanceDetail.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? modeOfPayment;
  String? openingAmount;
  int? idx;
  String? name;

  Map<String, dynamic> toMap() => {
        'mode_of_payment': modeOfPayment,
        'opening_amount': openingAmount,
        'idx': idx,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Converts [BalanceDetail] to a JSON string.
  String toJson() => json.encode(toMap());
}
