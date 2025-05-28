import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:frappe_client/src/models/get_pos_profile_data_response/pos_profile.dart';

class GetPosProfileDataResponse extends Equatable {
  const GetPosProfileDataResponse({this.message});

  factory GetPosProfileDataResponse.fromMap(Map<String, dynamic> data) {
    return GetPosProfileDataResponse(
      message: data['message'] == null
          ? null
          : PosProfile.fromMap(data['message'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetPosProfileDataResponse].
  factory GetPosProfileDataResponse.fromJson(String data) {
    return GetPosProfileDataResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  final PosProfile? message;

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [GetPosProfileDataResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [message];
}
