import 'dart:convert';

import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  const Payment({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.paymentDefault,
    this.allowInReturns,
    this.modeOfPayment,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
  });

  factory Payment.fromMap(Map<String, dynamic> data) => Payment(
        name: data['name'] as String?,
        owner: data['owner'] as String?,
        creation: data['creation'] as String?,
        modified: data['modified'] as String?,
        modifiedBy: data['modified_by'] as String?,
        docstatus: data['docstatus'] as int?,
        idx: data['idx'] as int?,
        paymentDefault: data['default'] as int?,
        allowInReturns: data['allow_in_returns'] as int?,
        modeOfPayment: data['mode_of_payment'] as String?,
        parent: data['parent'] as String?,
        parentfield: data['parentfield'] as String?,
        parenttype: data['parenttype'] as String?,
        doctype: data['doctype'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Payment].
  factory Payment.fromJson(String data) {
    return Payment.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final int? paymentDefault;
  final int? allowInReturns;
  final String? modeOfPayment;
  final String? parent;
  final String? parentfield;
  final String? parenttype;
  final String? doctype;

  Map<String, dynamic> toMap() => {
        'name': name,
        'owner': owner,
        'creation': creation,
        'modified': modified,
        'modified_by': modifiedBy,
        'docstatus': docstatus,
        'idx': idx,
        'default': paymentDefault,
        'allow_in_returns': allowInReturns,
        'mode_of_payment': modeOfPayment,
        'parent': parent,
        'parentfield': parentfield,
        'parenttype': parenttype,
        'doctype': doctype,
      };

  /// `dart:convert`
  ///
  /// Converts [Payment] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      name,
      owner,
      creation,
      modified,
      modifiedBy,
      docstatus,
      idx,
      paymentDefault,
      allowInReturns,
      modeOfPayment,
      parent,
      parentfield,
      parenttype,
      doctype,
    ];
  }
}
