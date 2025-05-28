import 'dart:convert';

class OpeningEntry {
  OpeningEntry({
    this.name,
    this.company,
    this.posProfile,
    this.periodStartDate,
  });

  factory OpeningEntry.fromMap(Map<String, dynamic> data) => OpeningEntry(
        name: data['name'] as String?,
        company: data['company'] as String?,
        posProfile: data['pos_profile'] as String?,
        periodStartDate: data['period_start_date'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OpeningEntry].
  factory OpeningEntry.fromJson(String data) {
    return OpeningEntry.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? name;
  String? company;
  String? posProfile;
  String? periodStartDate;

  Map<String, dynamic> toMap() => {
        'name': name,
        'company': company,
        'pos_profile': posProfile,
        'period_start_date': periodStartDate,
      };

  /// `dart:convert`
  ///
  /// Converts [OpeningEntry] to a JSON string.
  String toJson() => json.encode(toMap());
}
