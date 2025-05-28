import 'dart:convert';

class GetFiscalYearResponse {
  GetFiscalYearResponse({this.message});

  factory GetFiscalYearResponse.fromMap(Map<String, dynamic> data) {
    return GetFiscalYearResponse(
      message: data['message'] == null
          ? []
          : List<String>.from(data['message'] as List<dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetFiscalYearResponse].
  factory GetFiscalYearResponse.fromJson(String data) {
    return GetFiscalYearResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  List<String>? message;

  Map<String, dynamic> toMap() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Converts [GetFiscalYearResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
