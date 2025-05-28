import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaymentReconciliation extends Equatable {
  const PaymentReconciliation({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.modeOfPayment,
    this.openingAmount,
    this.expectedAmount,
    this.closingAmount,
    this.difference,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
    this.islocal,
    this.unsaved,
  });

  factory PaymentReconciliation.fromMap(Map<String, dynamic> data) {
    return PaymentReconciliation(
      name: data['name'] as String?,
      owner: data['owner'] as String?,
      creation: data['creation'] as String?,
      modified: data['modified'] as String?,
      modifiedBy: data['modified_by'] as String?,
      docstatus: data['docstatus'] as int?,
      idx: data['idx'] as int?,
      modeOfPayment: data['mode_of_payment'] as String?,
      openingAmount: (data['opening_amount'] as num).toDouble(),
      expectedAmount: (data['expected_amount'] as num).toDouble(),
      closingAmount: (data['closing_amount'] as num).toDouble(),
      difference: (data['difference'] as num).toDouble(),
      parent: data['parent'] as String?,
      parentfield: data['parentfield'] as String?,
      parenttype: data['parenttype'] as String?,
      doctype: data['doctype'] as String?,
      islocal: data['__islocal'] as int?,
      unsaved: data['__unsaved'] as int?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentReconciliation].
  factory PaymentReconciliation.fromJson(String data) {
    return PaymentReconciliation.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? modeOfPayment;
  final double? openingAmount;
  final double? expectedAmount;
  final double? closingAmount;
  final double? difference;
  final String? parent;
  final String? parentfield;
  final String? parenttype;
  final String? doctype;
  final int? islocal;
  final int? unsaved;

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (owner != null) 'owner': owner,
        if (creation != null) 'creation': creation,
        if (modified != null) 'modified': modified,
        if (modifiedBy != null) 'modified_by': modifiedBy,
        if (docstatus != null) 'docstatus': docstatus,
        if (idx != null) 'idx': idx,
        if (modeOfPayment != null) 'mode_of_payment': modeOfPayment,
        if (openingAmount != null) 'opening_amount': openingAmount,
        if (expectedAmount != null) 'expected_amount': expectedAmount,
        if (closingAmount != null) 'closing_amount': closingAmount,
        if (difference != null) 'difference': difference,
        if (parent != null) 'parent': parent,
        if (parentfield != null) 'parentfield': parentfield,
        if (parenttype != null) 'parenttype': parenttype,
        if (doctype != null) 'doctype': doctype,
        if (islocal != null) '__islocal': islocal,
        if (unsaved != null) '__unsaved': unsaved,
      };

  /// `dart:convert`
  ///
  /// Converts [PaymentReconciliation] to a JSON string.
  String toJson() => json.encode(toMap());

  PaymentReconciliation copyWith({
    String? name,
    String? owner,
    String? creation,
    String? modified,
    String? modifiedBy,
    int? docstatus,
    int? idx,
    String? modeOfPayment,
    double? openingAmount,
    double? expectedAmount,
    double? closingAmount,
    double? difference,
    String? parent,
    String? parentfield,
    String? parenttype,
    String? doctype,
    int? islocal,
    int? unsaved,
  }) {
    return PaymentReconciliation(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      creation: creation ?? this.creation,
      modified: modified ?? this.modified,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      docstatus: docstatus ?? this.docstatus,
      idx: idx ?? this.idx,
      modeOfPayment: modeOfPayment ?? this.modeOfPayment,
      openingAmount: openingAmount ?? this.openingAmount,
      expectedAmount: expectedAmount ?? this.expectedAmount,
      closingAmount: closingAmount ?? this.closingAmount,
      difference: difference ?? this.difference,
      parent: parent ?? this.parent,
      parentfield: parentfield ?? this.parentfield,
      parenttype: parenttype ?? this.parenttype,
      doctype: doctype ?? this.doctype,
      islocal: islocal ?? this.islocal,
      unsaved: unsaved ?? this.unsaved,
    );
  }

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
      modeOfPayment,
      openingAmount,
      expectedAmount,
      closingAmount,
      difference,
      parent,
      parentfield,
      parenttype,
      doctype,
      islocal,
      unsaved,
    ];
  }
}
