import 'dart:convert';

class Doc {
  Doc({
    required this.docstatus,
    required this.doctype,
    required this.name,
    required this.islocal,
    required this.unsaved,
    required this.owner,
    required this.namingSeries,
    required this.customerType,
    required this.isInternalCustomer,
    required this.companies,
    required this.language,
    required this.creditLimits,
    required this.accounts,
    required this.salesTeam,
    required this.soRequired,
    required this.dnRequired,
    required this.isFrozen,
    required this.disabled,
    required this.portalUsers,
    required this.runLinkTriggers,
    required this.customerName,
    required this.customIdType,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.county,
    this.country,
    this.pincode,
    this.emailId,
    this.mobileNo,
    this.emailAddress,
    this.mobileNumber,
    this.customIdNumber,
  });

  factory Doc.fromMap(Map<String, dynamic> data) => Doc(
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
        addressLine1: data['address_line1'] as String?,
        addressLine2: data['address_line2'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        county: data['county'] as String?,
        country: data['country'] as String?,
        pincode: data['pincode'] as String?,
        emailId: data['email_id'] as String?,
        mobileNo: data['mobile_no'] as String?,
        emailAddress: data['email_address'] as String?,
        mobileNumber: data['mobile_number'] as String?,
        customIdType: data['custom_id_type'] as String,
        customIdNumber: data['custom_id_number'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Doc].
  factory Doc.fromJson(String data) {
    return Doc.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  int docstatus;
  String doctype;
  String name;
  int islocal;
  int unsaved;
  String owner;
  String namingSeries;
  String customerType;
  int isInternalCustomer;
  List<dynamic> companies;
  String language;
  List<dynamic> creditLimits;
  List<dynamic> accounts;
  List<dynamic> salesTeam;
  int soRequired;
  int dnRequired;
  int isFrozen;
  int disabled;
  List<dynamic> portalUsers;
  int runLinkTriggers;
  String customerName;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? county;
  String? country;
  String? pincode;
  String? emailId;
  String? mobileNo;
  String? emailAddress;
  String? mobileNumber;
  String customIdType;
  String? customIdNumber;

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
        if (addressLine1 != null) 'address_line1': addressLine1,
        if (addressLine2 != null) 'address_line2': addressLine2,
        if (city != null) 'city': city,
        if (state != null) 'state': state,
        if (county != null) 'county': county,
        if (country != null) 'country': country,
        if (pincode != null) 'pincode': pincode,
        if (emailId != null) 'email_id': emailId,
        if (mobileNo != null) 'mobile_no': mobileNo,
        if (emailAddress != null) 'email_address': emailAddress,
        if (mobileNumber != null) 'mobile_number': mobileNumber,
        'custom_id_type': customIdType,
        if (customIdNumber != null) 'custom_id_number': customIdNumber,
      };

  /// `dart:convert`
  ///
  /// Converts [Doc] to a JSON string.
  String toJson() => json.encode(toMap());
}
