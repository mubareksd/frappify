import 'dart:convert';

class CreateCustomerRequest {
  CreateCustomerRequest({
    required this.name,
    required this.owner,
    required this.customerName,
    required this.addressLine1,
    required this.city,
    required this.state,
    required this.zone,
    required this.wereda,
    required this.country,
    required this.emailId,
    required this.mobileNo,
    required this.emailAddress,
    required this.mobileNumber,
    required this.taxId,
    required this.vatRegNo,
    required this.customIdType,
    this.docstatus = 0,
    this.doctype = 'Customer',
    this.islocal = 1,
    this.unsaved = 1,
    this.namingSeries = 'CUST-.YYYY.-',
    this.customerType = 'Individual',
    this.isInternalCustomer = 0,
    this.companies = const [],
    this.language = 'en',
    this.creditLimits = const [],
    this.accounts = const [],
    this.salesTeam = const [],
    this.soRequired = 0,
    this.dnRequired = 0,
    this.isFrozen = 0,
    this.disabled = 0,
    this.portalUsers = const [],
    this.runLinkTriggers = 1,
    this.addressLine2,
    this.customIdNumber,
  });

  factory CreateCustomerRequest.fromMap(Map<String, dynamic> data) {
    return CreateCustomerRequest(
      docstatus: data['docstatus'] as int,
      doctype: data['doctype'] as String,
      name: data['name'] as String,
      islocal: data['__islocal'] as int,
      unsaved: data['__unsaved'] as int,
      owner: data['owner'] as String,
      namingSeries: data['naming_series'] as String,
      customerType: data['customer_type'] as String,
      isInternalCustomer: data['is_internal_customer'] as int,
      companies: data['companies'] as List<dynamic>,
      language: data['language'] as String,
      creditLimits: data['credit_limits'] as List<dynamic>,
      accounts: data['accounts'] as List<dynamic>,
      salesTeam: data['sales_team'] as List<dynamic>,
      soRequired: data['so_required'] as int,
      dnRequired: data['dn_required'] as int,
      isFrozen: data['is_frozen'] as int,
      disabled: data['disabled'] as int,
      portalUsers: data['portal_users'] as List<dynamic>,
      runLinkTriggers: data['__run_link_triggers'] as int,
      customerName: data['customer_name'] as String,
      addressLine1: data['address_line1'] as String,
      city: data['city'] as String,
      state: data['state'] as String,
      zone: data['zone'] as String,
      wereda: data['wereda'] as String,
      country: data['country'] as String,
      addressLine2: data['address_line2'] as String?,
      emailId: data['email_id'] as String,
      mobileNo: data['mobile_no'] as String,
      emailAddress: data['email_address'] as String,
      mobileNumber: data['mobile_number'] as String,
      taxId: data['tax_id'] as String,
      vatRegNo: data['custom_vat_number'] as String,
      customIdType: data['custom_id_type'] as String,
      customIdNumber: data['custom_id_number'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateCustomerRequest].
  factory CreateCustomerRequest.fromJson(String data) {
    return CreateCustomerRequest.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  final int docstatus;
  final String doctype;
  final String name;
  final int islocal;
  final int unsaved;
  final String owner;
  final String namingSeries;
  final String customerType;
  final int isInternalCustomer;
  final List<dynamic> companies;
  final String language;
  final List<dynamic> creditLimits;
  final List<dynamic> accounts;
  final List<dynamic> salesTeam;
  final int soRequired;
  final int dnRequired;
  final int isFrozen;
  final int disabled;
  final List<dynamic> portalUsers;
  final int runLinkTriggers;
  final String customerName;
  final String addressLine1;
  final String city;
  final String state;
  final String country;
  final String? addressLine2;
  final String emailId;
  final String mobileNo;
  final String emailAddress;
  final String mobileNumber;
  final String taxId;
  final String vatRegNo;
  final String zone;
  final String wereda;
  final String customIdType;
  final String? customIdNumber;

  Map<String, dynamic> toMap() => {
        'docstatus': docstatus,
        'doctype': doctype,
        'name': name,
        '__islocal': islocal,
        '__unsaved': unsaved,
        'owner': owner,
        'naming_series': namingSeries,
        'customer_type': customerType,
        'is_internal_customer': isInternalCustomer,
        'companies': companies,
        'language': language,
        'credit_limits': creditLimits,
        'accounts': accounts,
        'sales_team': salesTeam,
        'so_required': soRequired,
        'dn_required': dnRequired,
        'is_frozen': isFrozen,
        'disabled': disabled,
        'portal_users': portalUsers,
        '__run_link_triggers': runLinkTriggers,
        'customer_name': customerName,
        'address_line1': addressLine1,
        'city': city,
        'state': state,
        'zone': zone,
        'wereda': wereda,
        'country': country,
        'address_line2': addressLine2 ?? '',
        'email_id': emailId,
        'mobile_no': mobileNo,
        'email_address': emailAddress,
        'mobile_number': mobileNumber,
        'tax_id': taxId,
        'custom_vat_number': vatRegNo,
        'custom_id_type': customIdType,
        if (customIdNumber != null) 'custom_id_number': customIdNumber,
      };

  /// `dart:convert`
  ///
  /// Converts [CreateCustomerRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
