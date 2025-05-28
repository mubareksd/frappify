import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomerGroup extends Equatable {
  const CustomerGroup({this.name, this.lft, this.rgt});

  factory CustomerGroup.fromMap(Map<String, dynamic> data) => CustomerGroup(
        name: data['name'] as String?,
        lft: data['lft'] as int?,
        rgt: data['rgt'] as int?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomerGroup].
  factory CustomerGroup.fromJson(String data) {
    return CustomerGroup.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final int? lft;
  final int? rgt;

  Map<String, dynamic> toMap() => {
        'name': name,
        'lft': lft,
        'rgt': rgt,
      };

  /// `dart:convert`
  ///
  /// Converts [CustomerGroup] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name, lft, rgt];
}
