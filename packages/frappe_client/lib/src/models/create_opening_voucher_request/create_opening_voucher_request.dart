import 'dart:convert';

import 'package:frappe_client/src/models/create_opening_voucher_request/balance_detail.dart';

class CreateOpeningVoucherRequest {
  CreateOpeningVoucherRequest({
    required this.posProfile,
    required this.company,
    required this.balanceDetails,
  });

  factory CreateOpeningVoucherRequest.fromMap(Map<String, dynamic> data) {
    return CreateOpeningVoucherRequest(
      posProfile: data['pos_profile'] as String,
      company: data['company'] as String,
      balanceDetails:
          (jsonDecode(data['balance_details'] as String) as List<dynamic>)
              .map((e) => BalanceDetail.fromMap(e as Map<String, dynamic>))
              .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateOpeningVoucherRequest].
  factory CreateOpeningVoucherRequest.fromJson(String data) {
    return CreateOpeningVoucherRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  String posProfile;
  String company;
  List<BalanceDetail> balanceDetails;

  Map<String, dynamic> toMap() => {
        'pos_profile': posProfile,
        'company': company,
        'balance_details':
            jsonEncode(balanceDetails.map((e) => e.toMap()).toList()),
      };

  /// `dart:convert`
  ///
  /// Converts [CreateOpeningVoucherRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
