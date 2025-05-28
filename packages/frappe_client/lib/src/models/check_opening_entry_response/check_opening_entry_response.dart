import 'dart:convert';

import 'package:frappe_client/src/models/check_opening_entry_response/opening_entry.dart';

class CheckOpeningEntryResponse {
  CheckOpeningEntryResponse({this.message});

  factory CheckOpeningEntryResponse.fromMap(Map<String, dynamic> data) {
    return CheckOpeningEntryResponse(
      message: (data['message'] as List<dynamic>?)
          ?.map((e) => OpeningEntry.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CheckOpeningEntryResponse].
  factory CheckOpeningEntryResponse.fromJson(String data) {
    return CheckOpeningEntryResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  List<OpeningEntry>? message;

  Map<String, dynamic> toMap() => {
        'message': message?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [CheckOpeningEntryResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
