import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:frappe_client/src/models/pos_closing_entry/payment_reconciliation.dart';
import 'package:frappe_client/src/models/pos_closing_entry/pos_transaction.dart';
import 'package:frappe_client/src/models/pos_closing_entry/tax.dart';

class PosClosingEntry extends Equatable {
  const PosClosingEntry({
    this.name,
    this.islocal,
    this.unsaved,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.periodStartDate,
    this.periodEndDate,
    this.postingDate,
    this.postingTime,
    this.posOpeningEntry,
    this.status,
    this.company,
    this.posProfile,
    this.user,
    this.grandTotal,
    this.netTotal,
    this.totalQuantity,
    this.errorMessage,
    this.amendedFrom,
    this.doctype,
    this.posTransactions,
    this.paymentReconciliation,
    this.taxes,
  });

  factory PosClosingEntry.fromMap(Map<String, dynamic> data) {
    return PosClosingEntry(
      name: data['name'] as String?,
      islocal: data['__islocal'] as int?,
      unsaved: data['__unsaved'] as int?,
      owner: data['owner'] as String?,
      creation: data['creation'] as String?,
      modified: data['modified'] as String?,
      modifiedBy: data['modified_by'] as String?,
      docstatus: data['docstatus'] as int?,
      idx: data['idx'] as int?,
      periodStartDate: data['period_start_date'] as String?,
      periodEndDate: data['period_end_date'] as String?,
      postingDate: data['posting_date'] as String?,
      postingTime: data['posting_time'] as String?,
      posOpeningEntry: data['pos_opening_entry'] as String?,
      status: data['status'] as String?,
      company: data['company'] as String?,
      posProfile: data['pos_profile'] as String?,
      user: data['user'] as String?,
      grandTotal: (data['grand_total'] as num).toDouble(),
      netTotal: (data['net_total'] as num).toDouble(),
      totalQuantity: (data['total_quantity'] as num).toDouble(),
      errorMessage: data['error_message'] as String?,
      amendedFrom: data['amended_from'] as dynamic,
      doctype: data['doctype'] as String?,
      posTransactions: (data['pos_transactions'] as List<dynamic>?)
          ?.map((e) => PosTransaction.fromMap(e as Map<String, dynamic>))
          .toList(),
      paymentReconciliation: (data['payment_reconciliation'] as List<dynamic>?)
          ?.map((e) => PaymentReconciliation.fromMap(e as Map<String, dynamic>))
          .toList(),
      taxes: (data['taxes'] as List<dynamic>?)
          ?.map((e) => Tax.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PosClosingEntry].
  factory PosClosingEntry.fromJson(String data) {
    return PosClosingEntry.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final int? islocal;
  final int? unsaved;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? periodStartDate;
  final String? periodEndDate;
  final String? postingDate;
  final String? postingTime;
  final String? posOpeningEntry;
  final String? status;
  final String? company;
  final String? posProfile;
  final String? user;
  final double? grandTotal;
  final double? netTotal;
  final double? totalQuantity;
  final String? errorMessage;
  final dynamic amendedFrom;
  final String? doctype;
  final List<PosTransaction>? posTransactions;
  final List<PaymentReconciliation>? paymentReconciliation;
  final List<Tax>? taxes;

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (islocal != null) '__islocal': islocal,
        if (unsaved != null) '__unsaved': unsaved,
        if (owner != null) 'owner': owner,
        if (creation != null) 'creation': creation,
        if (modified != null) 'modified': modified,
        if (modifiedBy != null) 'modified_by': modifiedBy,
        if (docstatus != null) 'docstatus': docstatus,
        if (idx != null) 'idx': idx,
        if (periodStartDate != null) 'period_start_date': periodStartDate,
        if (periodEndDate != null) 'period_end_date': periodEndDate,
        if (postingDate != null) 'posting_date': postingDate,
        if (postingTime != null) 'posting_time': postingTime,
        if (posOpeningEntry != null) 'pos_opening_entry': posOpeningEntry,
        if (status != null) 'status': status,
        if (company != null) 'company': company,
        if (posProfile != null) 'pos_profile': posProfile,
        if (user != null) 'user': user,
        if (grandTotal != null) 'grand_total': grandTotal,
        if (netTotal != null) 'net_total': netTotal,
        if (totalQuantity != null) 'total_quantity': totalQuantity,
        if (errorMessage != null) 'error_message': errorMessage,
        if (amendedFrom != null) 'amended_from': amendedFrom,
        if (doctype != null) 'doctype': doctype,
        if (posTransactions != null)
          'pos_transactions': posTransactions?.map((e) => e.toMap()).toList(),
        if (paymentReconciliation != null)
          'payment_reconciliation':
              paymentReconciliation?.map((e) => e.toMap()).toList(),
        if (taxes != null) 'taxes': taxes?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [PosClosingEntry] to a JSON string.
  String toJson() => json.encode(toMap());

  PosClosingEntry copyWith({
    String? name,
    int? islocal,
    int? unsaved,
    String? owner,
    String? creation,
    String? modified,
    String? modifiedBy,
    int? docstatus,
    int? idx,
    String? periodStartDate,
    String? periodEndDate,
    String? postingDate,
    String? postingTime,
    String? posOpeningEntry,
    String? status,
    String? company,
    String? posProfile,
    String? user,
    double? grandTotal,
    double? netTotal,
    double? totalQuantity,
    String? errorMessage,
    dynamic amendedFrom,
    String? doctype,
    List<PosTransaction>? posTransactions,
    List<PaymentReconciliation>? paymentReconciliation,
    List<Tax>? taxes,
  }) {
    return PosClosingEntry(
      name: name ?? this.name,
      islocal: islocal ?? this.islocal,
      unsaved: unsaved ?? this.unsaved,
      owner: owner ?? this.owner,
      creation: creation ?? this.creation,
      modified: modified ?? this.modified,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      docstatus: docstatus ?? this.docstatus,
      idx: idx ?? this.idx,
      periodStartDate: periodStartDate ?? this.periodStartDate,
      periodEndDate: periodEndDate ?? this.periodEndDate,
      postingDate: postingDate ?? this.postingDate,
      postingTime: postingTime ?? this.postingTime,
      posOpeningEntry: posOpeningEntry ?? this.posOpeningEntry,
      status: status ?? this.status,
      company: company ?? this.company,
      posProfile: posProfile ?? this.posProfile,
      user: user ?? this.user,
      grandTotal: grandTotal ?? this.grandTotal,
      netTotal: netTotal ?? this.netTotal,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      errorMessage: errorMessage ?? this.errorMessage,
      amendedFrom: amendedFrom ?? this.amendedFrom,
      doctype: doctype ?? this.doctype,
      posTransactions: posTransactions ?? this.posTransactions,
      paymentReconciliation:
          paymentReconciliation ?? this.paymentReconciliation,
      taxes: taxes ?? this.taxes,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      islocal,
      unsaved,
      owner,
      creation,
      modified,
      modifiedBy,
      docstatus,
      idx,
      periodStartDate,
      periodEndDate,
      postingDate,
      postingTime,
      posOpeningEntry,
      status,
      company,
      posProfile,
      user,
      grandTotal,
      netTotal,
      totalQuantity,
      errorMessage,
      amendedFrom,
      doctype,
      posTransactions,
      paymentReconciliation,
      taxes,
    ];
  }
}
