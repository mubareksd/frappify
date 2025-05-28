import 'dart:convert';

import 'package:equatable/equatable.dart';

class PosTransaction extends Equatable {
  const PosTransaction({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.posInvoice,
    this.postingDate,
    this.customer,
    this.grandTotal,
    this.isReturn,
    this.returnAgainst,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
    this.islocal,
    this.unsaved,
  });

  factory PosTransaction.fromMap(Map<String, dynamic> data) {
    return PosTransaction(
      name: data['name'] as String?,
      owner: data['owner'] as String?,
      creation: data['creation'] as String?,
      modified: data['modified'] as String?,
      modifiedBy: data['modified_by'] as String?,
      docstatus: data['docstatus'] as int?,
      idx: data['idx'] as int?,
      posInvoice: data['pos_invoice'] as String?,
      postingDate: data['posting_date'] as String?,
      customer: data['customer'] as String?,
      grandTotal: (data['grand_total'] as num).toDouble(),
      isReturn: data['is_return'] as int?,
      returnAgainst: data['return_against'] as dynamic,
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
  /// Parses the string and returns the resulting Json object as [PosTransaction].
  factory PosTransaction.fromJson(String data) {
    return PosTransaction.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? posInvoice;
  final String? postingDate;
  final String? customer;
  final double? grandTotal;
  final int? isReturn;
  final dynamic returnAgainst;
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
        if (posInvoice != null) 'pos_invoice': posInvoice,
        if (postingDate != null) 'posting_date': postingDate,
        if (customer != null) 'customer': customer,
        if (grandTotal != null) 'grand_total': grandTotal,
        if (isReturn != null) 'is_return': isReturn,
        if (returnAgainst != null) 'return_against': returnAgainst,
        if (parent != null) 'parent': parent,
        if (parentfield != null) 'parentfield': parentfield,
        if (parenttype != null) 'parenttype': parenttype,
        if (doctype != null) 'doctype': doctype,
        if (islocal != null) '__islocal': islocal,
        if (unsaved != null) '__unsaved': unsaved,
      };

  /// `dart:convert`
  ///
  /// Converts [PosTransaction] to a JSON string.
  String toJson() => json.encode(toMap());

  PosTransaction copyWith({
    String? name,
    String? owner,
    String? creation,
    String? modified,
    String? modifiedBy,
    int? docstatus,
    int? idx,
    String? posInvoice,
    String? postingDate,
    String? customer,
    double? grandTotal,
    int? isReturn,
    dynamic returnAgainst,
    String? parent,
    String? parentfield,
    String? parenttype,
    String? doctype,
    int? islocal,
    int? unsaved,
  }) {
    return PosTransaction(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      creation: creation ?? this.creation,
      modified: modified ?? this.modified,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      docstatus: docstatus ?? this.docstatus,
      idx: idx ?? this.idx,
      posInvoice: posInvoice ?? this.posInvoice,
      postingDate: postingDate ?? this.postingDate,
      customer: customer ?? this.customer,
      grandTotal: grandTotal ?? this.grandTotal,
      isReturn: isReturn ?? this.isReturn,
      returnAgainst: returnAgainst ?? this.returnAgainst,
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
      posInvoice,
      postingDate,
      customer,
      grandTotal,
      isReturn,
      returnAgainst,
      parent,
      parentfield,
      parenttype,
      doctype,
      islocal,
      unsaved,
    ];
  }
}
