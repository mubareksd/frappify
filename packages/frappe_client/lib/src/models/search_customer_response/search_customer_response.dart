import 'dart:convert';

// The main response model
class SearchCustomerResponse {
  SearchCustomerResponse({required this.customers});

  factory SearchCustomerResponse.fromJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr) as Map<String, dynamic>;
    final customerList = jsonMap['message'] as List;
    return SearchCustomerResponse(
      customers: customerList
          .map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  final List<Customer> customers;

  Map<String, dynamic> toJson() {
    return {
      'message': customers.map((e) => e.toJson()).toList(),
    };
  }
}


// The customer model
class Customer {
  Customer({
    required this.value,
    required this.description,
    this.label,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      value: json['value'] as String,
      label: json['label'] as String?,
      description: json['description'] as String,
    );
  }
  final String value;
  final String? label;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
      'description': description,
    };
  }
}
