import 'dart:convert';

class Payment {
  Payment({
    this.docstatus,
    this.idx,
    this.paymentDefault,
    this.modeOfPayment,
    this.amount,
    this.account,
    this.type,
    this.baseAmount,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
    this.islocal,
    this.name,
  });

  factory Payment.fromMap(Map<String, dynamic> data) => Payment(
        docstatus: data['docstatus'] as int?,
        idx: data['idx'] as int?,
        paymentDefault: data['default'] as int?,
        modeOfPayment: data['mode_of_payment'] as String?,
        amount: data['amount'] as int?,
        account: data['account'] as String?,
        type: data['type'] as String?,
        baseAmount: data['base_amount'] as int?,
        parent: data['parent'] as String?,
        parentfield: data['parentfield'] as String?,
        parenttype: data['parenttype'] as String?,
        doctype: data['doctype'] as String?,
        islocal: data['__islocal'] as int?,
        name: data['name'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Payment].
  factory Payment.fromJson(String data) {
    return Payment.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  int? docstatus;
  int? idx;
  int? paymentDefault;
  String? modeOfPayment;
  int? amount;
  String? account;
  String? type;
  int? baseAmount;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;
  int? islocal;
  String? name;

  Map<String, dynamic> toMap() => {
        'docstatus': docstatus,
        'idx': idx,
        'default': paymentDefault,
        'mode_of_payment': modeOfPayment,
        'amount': amount,
        'account': account,
        'type': type,
        'base_amount': baseAmount,
        'parent': parent,
        'parentfield': parentfield,
        'parenttype': parenttype,
        'doctype': doctype,
        '__islocal': islocal,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Converts [Payment] to a JSON string.
  String toJson() => json.encode(toMap());
}
