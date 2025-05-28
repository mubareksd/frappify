import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomTaxRate extends Equatable {
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? taxRate;
  final String? fiscalPrinterTaxId;
  final String? parent;
  final String? parentfield;
  final String? parenttype;
  final String? doctype;

  const CustomTaxRate({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.taxRate,
    this.fiscalPrinterTaxId,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
  });

  factory CustomTaxRate.fromMap(Map<String, dynamic> data) => CustomTaxRate(
        name: data['name'] as String?,
        owner: data['owner'] as String?,
        creation: data['creation'] as String?,
        modified: data['modified'] as String?,
        modifiedBy: data['modified_by'] as String?,
        docstatus: data['docstatus'] as int?,
        idx: data['idx'] as int?,
        taxRate: data['tax_rate'] as String?,
        fiscalPrinterTaxId: data['fiscal_printer_tax_id'] as String?,
        parent: data['parent'] as String?,
        parentfield: data['parentfield'] as String?,
        parenttype: data['parenttype'] as String?,
        doctype: data['doctype'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'owner': owner,
        'creation': creation,
        'modified': modified,
        'modified_by': modifiedBy,
        'docstatus': docstatus,
        'idx': idx,
        'tax_rate': taxRate,
        'fiscal_printer_tax_id': fiscalPrinterTaxId,
        'parent': parent,
        'parentfield': parentfield,
        'parenttype': parenttype,
        'doctype': doctype,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomTaxRate].
  factory CustomTaxRate.fromJson(String data) {
    return CustomTaxRate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CustomTaxRate] to a JSON string.
  String toJson() => json.encode(toMap());

  CustomTaxRate copyWith({
    String? name,
    String? owner,
    String? creation,
    String? modified,
    String? modifiedBy,
    int? docstatus,
    int? idx,
    String? taxRate,
    String? fiscalPrinterTaxId,
    String? parent,
    String? parentfield,
    String? parenttype,
    String? doctype,
  }) {
    return CustomTaxRate(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      creation: creation ?? this.creation,
      modified: modified ?? this.modified,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      docstatus: docstatus ?? this.docstatus,
      idx: idx ?? this.idx,
      taxRate: taxRate ?? this.taxRate,
      fiscalPrinterTaxId: fiscalPrinterTaxId ?? this.fiscalPrinterTaxId,
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
      taxRate,
      fiscalPrinterTaxId,
      parent,
      parentfield,
      parenttype,
      doctype,
    ];
  }
}
