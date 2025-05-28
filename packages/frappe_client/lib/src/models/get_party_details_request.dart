import 'dart:convert';

class GetPartyDetailsRequest {
  GetPartyDetailsRequest({
    this.postingDate,
    this.party,
    this.partyType,
    this.account,
    this.priceList,
    this.posProfile,
    this.currency,
    this.company,
    this.doctype,
  });

  factory GetPartyDetailsRequest.fromMap(Map<String, dynamic> data) {
    return GetPartyDetailsRequest(
      postingDate: data['posting_date'] as String?,
      party: data['party'] as String?,
      partyType: data['party_type'] as String?,
      account: data['account'] as String?,
      priceList: data['price_list'] as String?,
      posProfile: data['pos_profile'] as String?,
      currency: data['currency'] as String?,
      company: data['company'] as String?,
      doctype: data['doctype'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetPartyDetailsRequest].
  factory GetPartyDetailsRequest.fromJson(String data) {
    return GetPartyDetailsRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  String? postingDate;
  String? party;
  String? partyType;
  String? account;
  String? priceList;
  String? posProfile;
  String? currency;
  String? company;
  String? doctype;

  Map<String, dynamic> toMap() => {
        if (postingDate != null) 'posting_date': postingDate,
        if (party != null) 'party': party,
        if (partyType != null) 'party_type': partyType,
        if (account != null) 'account': account,
        if (priceList != null) 'price_list': priceList,
        if (posProfile != null) 'pos_profile': posProfile,
        if (currency != null) 'currency': currency,
        if (company != null) 'company': company,
        if (doctype != null) 'doctype': doctype,
      };

  /// `dart:convert`
  ///
  /// Converts [GetPartyDetailsRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
