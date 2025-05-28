import 'dart:convert';

import 'package:equatable/equatable.dart';

class BalanceDetail extends Equatable {
  const BalanceDetail({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.modeOfPayment,
    this.openingAmount,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
  });

  factory BalanceDetail.fromMap(Map<String, dynamic> data) => BalanceDetail(
        name: data['name'] as String?,
        owner: data['owner'] as String?,
        creation: data['creation'] as String?,
        modified: data['modified'] as String?,
        modifiedBy: data['modified_by'] as String?,
        docstatus: data['docstatus'] as int?,
        idx: data['idx'] as int?,
        modeOfPayment: data['mode_of_payment'] as String?,
        openingAmount: (data['opening_amount'] as num).toDouble(),
        parent: data['parent'] as String?,
        parentfield: data['parentfield'] as String?,
        parenttype: data['parenttype'] as String?,
        doctype: data['doctype'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BalanceDetail].
  factory BalanceDetail.fromJson(String data) {
    return BalanceDetail.fromMap(json.decode(data) as Map<String, dynamic>);
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
        'mode_of_payment': modeOfPayment,
        'opening_amount': openingAmount,
        'parent': parent,
        'parentfield': parentfield,
        'parenttype': parenttype,
        'doctype': doctype,
      };

  /// `dart:convert`
  ///
  /// Converts [BalanceDetail] to a JSON string.
  String toJson() => json.encode(toMap());

  BalanceDetail copyWith({
    String? name,
    String? owner,
    String? creation,
    String? modified,
    String? modifiedBy,
    int? docstatus,
    int? idx,
    String? modeOfPayment,
    double? openingAmount,
    String? parent,
    String? parentfield,
    String? parenttype,
    String? doctype,
  }) {
    return BalanceDetail(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      creation: creation ?? this.creation,
      modified: modified ?? this.modified,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      docstatus: docstatus ?? this.docstatus,
      idx: idx ?? this.idx,
      modeOfPayment: modeOfPayment ?? this.modeOfPayment,
      openingAmount: openingAmount ?? this.openingAmount,
      parent: parent ?? this.parent,
      parentfield: parentfield ?? this.parentfield,
      parenttype: parenttype ?? this.parenttype,
      doctype: doctype ?? this.doctype,
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
      parent,
      parentfield,
      parenttype,
      doctype,
    ];
  }
}
