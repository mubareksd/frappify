import 'dart:convert';

class SetCustomerInfoRequest {
  SetCustomerInfoRequest({this.fieldname, this.customer, this.value});

  factory SetCustomerInfoRequest.fromMap(Map<String, dynamic> data) {
    return SetCustomerInfoRequest(
      fieldname: data['fieldname'] as String?,
      customer: data['customer'] as String?,
      value: data['value'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SetCustomerInfoRequest].
  factory SetCustomerInfoRequest.fromJson(String data) {
    return SetCustomerInfoRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }
  String? fieldname;
  String? customer;
  String? value;

  Map<String, dynamic> toMap() => {
        'fieldname': fieldname,
        'customer': customer,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Converts [SetCustomerInfoRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
