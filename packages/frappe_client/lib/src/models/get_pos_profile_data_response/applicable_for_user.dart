import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApplicableForUser extends Equatable {
  const ApplicableForUser({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.applicableForUserDefault,
    this.user,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
  });

  factory ApplicableForUser.fromMap(Map<String, dynamic> data) {
    return ApplicableForUser(
      name: data['name'] as String?,
      owner: data['owner'] as String?,
      creation: data['creation'] as String?,
      modified: data['modified'] as String?,
      modifiedBy: data['modified_by'] as String?,
      docstatus: data['docstatus'] as int?,
      idx: data['idx'] as int?,
      applicableForUserDefault: data['default'] as int?,
      user: data['user'] as String?,
      parent: data['parent'] as String?,
      parentfield: data['parentfield'] as String?,
      parenttype: data['parenttype'] as String?,
      doctype: data['doctype'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplicableForUser].
  factory ApplicableForUser.fromJson(String data) {
    return ApplicableForUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final int? applicableForUserDefault;
  final String? user;
  final String? parent;
  final String? parentfield;
  final String? parenttype;
  final String? doctype;

  Map<String, dynamic> toMap() => {
        'name': name,
        'owner': owner,
        'creation': creation,
        'modified': modified,
        'modified_by': modifiedBy,
        'docstatus': docstatus,
        'idx': idx,
        'default': applicableForUserDefault,
        'user': user,
        'parent': parent,
        'parentfield': parentfield,
        'parenttype': parenttype,
        'doctype': doctype,
      };

  /// `dart:convert`
  ///
  /// Converts [ApplicableForUser] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      name,
      owner,
      creation,
      modified,
      modifiedBy,
      docstatus,
      idx,
      applicableForUserDefault,
      user,
      parent,
      parentfield,
      parenttype,
      doctype,
    ];
  }
}
