import 'dart:convert';

import 'package:frappe_client/src/models/create_opening_voucher_response/balance_detail.dart';

class Message {
  Message({
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

  factory Message.fromMap(Map<String, dynamic> data) => Message(
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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? periodStartDate;
  dynamic periodEndDate;
  String? status;
  String? postingDate;
  int? setPostingDate;
  String? company;
  String? posProfile;
  dynamic posClosingEntry;
  String? user;
  dynamic amendedFrom;
  String? doctype;
  List<BalanceDetail>? balanceDetails;

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
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());
}
