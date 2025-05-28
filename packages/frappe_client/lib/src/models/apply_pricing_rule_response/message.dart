import 'dart:convert';

class Message {
  Message({
    this.doctype,
    this.hasMargin,
    this.name,
    this.freeItemData,
    this.parent,
    this.parenttype,
    this.childDocname,
  });

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        doctype: data['doctype'] as String?,
        hasMargin: data['has_margin'] as bool?,
        name: data['name'] as String?,
        freeItemData: data['free_item_data'] as List<dynamic>?,
        parent: data['parent'] as String?,
        parenttype: data['parenttype'] as String?,
        childDocname: data['child_docname'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? doctype;
  bool? hasMargin;
  String? name;
  List<dynamic>? freeItemData;
  String? parent;
  String? parenttype;
  String? childDocname;

  Map<String, dynamic> toMap() => {
        'doctype': doctype,
        'has_margin': hasMargin,
        'name': name,
        'free_item_data': freeItemData,
        'parent': parent,
        'parenttype': parenttype,
        'child_docname': childDocname,
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());
}
