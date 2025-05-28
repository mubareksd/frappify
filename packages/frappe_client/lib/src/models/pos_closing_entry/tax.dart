import 'dart:convert';

import 'package:equatable/equatable.dart';

class Tax extends Equatable {
  const Tax({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.accountHead,
    this.rate,
    this.amount,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
    this.unsaved,
  });

  factory Tax.fromMap(Map<String, dynamic> data) => Tax(
        name: data['name'] as String?,
        owner: data['owner'] as String?,
        creation: data['creation'] as String?,
        modified: data['modified'] as String?,
        modifiedBy: data['modified_by'] as String?,
        docstatus: data['docstatus'] as int?,
        idx: data['idx'] as int?,
        accountHead: data['account_head'] as String?,
        rate: (data['rate'] as num).toDouble(),
        amount: (data['amount'] as num).toDouble(),
        parent: data['parent'] as String?,
        parentfield: data['parentfield'] as String?,
        parenttype: data['parenttype'] as String?,
        doctype: data['doctype'] as String?,
        unsaved: data['__unsaved'] as int?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tax].
  factory Tax.fromJson(String data) {
    return Tax.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? accountHead;
  final double? rate;
  final double? amount;
  final String? parent;
  final String? parentfield;
  final String? parenttype;
  final String? doctype;
  final int? unsaved;

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (owner != null) 'owner': owner,
        if (creation != null) 'creation': creation,
        if (modified != null) 'modified': modified,
        if (modifiedBy != null) 'modified_by': modifiedBy,
        if (docstatus != null) 'docstatus': docstatus,
        if (idx != null) 'idx': idx,
        if (accountHead != null) 'account_head': accountHead,
        if (rate != null) 'rate': rate,
        if (amount != null) 'amount': amount,
        if (parent != null) 'parent': parent,
        if (parentfield != null) 'parentfield': parentfield,
        if (parenttype != null) 'parenttype': parenttype,
        if (doctype != null) 'doctype': doctype,
        if (unsaved != null) '__unsaved': unsaved,
      };

  /// `dart:convert`
  ///
  /// Converts [Tax] to a JSON string.
  String toJson() => json.encode(toMap());

  Tax copyWith({
    String? name,
    String? owner,
    String? creation,
    String? modified,
    String? modifiedBy,
    int? docstatus,
    int? idx,
    String? accountHead,
    double? rate,
    double? amount,
    String? parent,
    String? parentfield,
    String? parenttype,
    String? doctype,
    int? unsaved,
  }) {
    return Tax(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      creation: creation ?? this.creation,
      modified: modified ?? this.modified,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      docstatus: docstatus ?? this.docstatus,
      idx: idx ?? this.idx,
      accountHead: accountHead ?? this.accountHead,
      rate: rate ?? this.rate,
      amount: amount ?? this.amount,
      parent: parent ?? this.parent,
      parentfield: parentfield ?? this.parentfield,
      parenttype: parenttype ?? this.parenttype,
      doctype: doctype ?? this.doctype,
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
      accountHead,
      rate,
      amount,
      parent,
      parentfield,
      parenttype,
      doctype,
      unsaved,
    ];
  }
}
