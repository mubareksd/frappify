import 'dart:convert';

class GetPosInvoicesRequest {
  GetPosInvoicesRequest({
    required this.start,
    required this.end,
    required this.posProfile,
    required this.user,
  });

  factory GetPosInvoicesRequest.fromMap(Map<String, dynamic> data) {
    return GetPosInvoicesRequest(
      start: data['start'] as String,
      end: data['end'] as String,
      posProfile: data['pos_profile'] as String,
      user: data['user'] as String,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetPosInvoicesRequest].
  factory GetPosInvoicesRequest.fromJson(String data) {
    return GetPosInvoicesRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  String start;
  String end;
  String posProfile;
  String user;

  Map<String, dynamic> toMap() => {
        'start': start,
        'end': end,
        'pos_profile': posProfile,
        'user': user,
      };

  /// `dart:convert`
  ///
  /// Converts [GetPosInvoicesRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
