import 'dart:convert';

class CheckOpeningEntryRequest {
  CheckOpeningEntryRequest({this.user});

  factory CheckOpeningEntryRequest.fromMap(Map<String, dynamic> data) {
    return CheckOpeningEntryRequest(
      user: data['user'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CheckOpeningEntryRequest].
  factory CheckOpeningEntryRequest.fromJson(String data) {
    return CheckOpeningEntryRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  String? user;

  Map<String, dynamic> toMap() => {
        'user': user,
      };

  /// `dart:convert`
  ///
  /// Converts [CheckOpeningEntryRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
