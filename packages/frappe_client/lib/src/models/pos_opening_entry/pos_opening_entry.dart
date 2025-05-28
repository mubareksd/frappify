import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:frappe_client/src/models/pos_opening_entry/balance_detail.dart';

class PosOpeningEntry extends Equatable {
  const PosOpeningEntry({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.periodStartDate,
    this.periodEndDate,
    this.status,
    this.postingDate,
    this.setPostingDate,
    this.company,
    this.posProfile,
    this.posClosingEntry,
    this.user,
    this.amendedFrom,
    this.doctype,
    this.balanceDetails,
  });

  factory PosOpeningEntry.fromMap(Map<String, dynamic> data) {
    return PosOpeningEntry(
      name: data['name'] as String?,
      owner: data['owner'] as String?,
      creation: data['creation'] as String?,
      modified: data['modified'] as String?,
      modifiedBy: data['modified_by'] as String?,
      docstatus: data['docstatus'] as int?,
      idx: data['idx'] as int?,
      periodStartDate: data['period_start_date'] as String?,
      periodEndDate: data['period_end_date'] as dynamic,
      status: data['status'] as String?,
      postingDate: data['posting_date'] as String?,
      setPostingDate: data['set_posting_date'] as int?,
      company: data['company'] as String?,
      posProfile: data['pos_profile'] as String?,
      posClosingEntry: data['pos_closing_entry'] as dynamic,
      user: data['user'] as String?,
      amendedFrom: data['amended_from'] as dynamic,
      doctype: data['doctype'] as String?,
      balanceDetails: (data['balance_details'] as List<dynamic>?)
          ?.map((e) => BalanceDetail.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PosOpeningEntry].
  factory PosOpeningEntry.fromJson(String data) {
    return PosOpeningEntry.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? periodStartDate;
  final dynamic periodEndDate;
  final String? status;
  final String? postingDate;
  final int? setPostingDate;
  final String? company;
  final String? posProfile;
  final dynamic posClosingEntry;
  final String? user;
  final dynamic amendedFrom;
  final String? doctype;
  final List<BalanceDetail>? balanceDetails;

  Map<String, dynamic> toMap() => {
        'name': name,
        'owner': owner,
        'creation': creation,
        'modified': modified,
        'modified_by': modifiedBy,
        'docstatus': docstatus,
        'idx': idx,
        'period_start_date': periodStartDate,
        'period_end_date': periodEndDate,
        'status': status,
        'posting_date': postingDate,
        'set_posting_date': setPostingDate,
        'company': company,
        'pos_profile': posProfile,
        'pos_closing_entry': posClosingEntry,
        'user': user,
        'amended_from': amendedFrom,
        'doctype': doctype,
        'balance_details': balanceDetails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [PosOpeningEntry] to a JSON string.
  String toJson() => json.encode(toMap());

  PosOpeningEntry copyWith({
    String? name,
    String? owner,
    String? creation,
    String? modified,
    String? modifiedBy,
    int? docstatus,
    int? idx,
    String? periodStartDate,
    dynamic periodEndDate,
    String? status,
    String? postingDate,
    int? setPostingDate,
    String? company,
    String? posProfile,
    dynamic posClosingEntry,
    String? user,
    dynamic amendedFrom,
    String? doctype,
    List<BalanceDetail>? balanceDetails,
  }) {
    return PosOpeningEntry(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      creation: creation ?? this.creation,
      modified: modified ?? this.modified,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      docstatus: docstatus ?? this.docstatus,
      idx: idx ?? this.idx,
      periodStartDate: periodStartDate ?? this.periodStartDate,
      periodEndDate: periodEndDate ?? this.periodEndDate,
      status: status ?? this.status,
      postingDate: postingDate ?? this.postingDate,
      setPostingDate: setPostingDate ?? this.setPostingDate,
      company: company ?? this.company,
      posProfile: posProfile ?? this.posProfile,
      posClosingEntry: posClosingEntry ?? this.posClosingEntry,
      user: user ?? this.user,
      amendedFrom: amendedFrom ?? this.amendedFrom,
      doctype: doctype ?? this.doctype,
      balanceDetails: balanceDetails ?? this.balanceDetails,
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
      periodStartDate,
      periodEndDate,
      status,
      postingDate,
      setPostingDate,
      company,
      posProfile,
      posClosingEntry,
      user,
      amendedFrom,
      doctype,
      balanceDetails,
    ];
  }
}
