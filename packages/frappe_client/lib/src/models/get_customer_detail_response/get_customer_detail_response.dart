// The main response model
class CustomerDetailResponse {
  CustomerDetailResponse({required this.posInvoice});

  factory CustomerDetailResponse.fromJson(Map<String, dynamic> jsonMap) {
    final message = jsonMap['message'] as Map<String, dynamic>;
    return CustomerDetailResponse(
      posInvoice: POSInvoice.fromJson(message),
    );
  }
  final POSInvoice posInvoice;

  Map<String, dynamic> toJson() {
    return {
      'message': posInvoice.toJson(),
    };
  }
}

// The POSInvoice model
class POSInvoice {
  POSInvoice({
    required this.customer,
    required this.debitTo,
    required this.dueDate,
    required this.contactPerson,
    required this.contactDisplay,
    required this.contactEmail,
    required this.contactMobile,
    required this.contactPhone,
    required this.customerName,
    required this.language,
    required this.priceListCurrency,
    required this.sellingPriceList,
    required this.currency,
    required this.salesTeam,
    this.customerAddress,
    this.addressDisplay,
    this.shippingAddressName,
    this.shippingAddress,
    this.companyAddress,
    this.companyAddressDisplay,
    this.taxCategory,
    this.contactDesignation,
    this.contactDepartment,
    this.customerGroup,
    this.territory,
    this.paymentTermsTemplate,
  });

  factory POSInvoice.fromJson(Map<String, dynamic> json) {
    return POSInvoice(
      customer: json['customer'] as String? ?? '',
      debitTo: json['debit_to'] as String? ?? '',
      dueDate: json['due_date'] as String? ?? '',
      customerAddress: json['customer_address'] as String?,
      addressDisplay: json['address_display'] as String?,
      shippingAddressName: json['shipping_address_name'] as String?,
      shippingAddress: json['shipping_address'] as String?,
      companyAddress: json['company_address'] as String?,
      companyAddressDisplay: json['company_address_display'] as String?,
      taxCategory: json['tax_category'] as String?,
      contactPerson: json['contact_person'] as String? ?? '',
      contactDisplay: json['contact_display'] as String? ?? '',
      contactEmail: json['contact_email'] as String? ?? '',
      contactMobile: json['contact_mobile'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      contactDesignation: json['contact_designation'] as String?,
      contactDepartment: json['contact_department'] as String?,
      customerName: json['customer_name'] as String? ?? '',
      customerGroup: json['customer_group'] as String?,
      territory: json['territory'] as String?,
      language: json['language'] as String? ?? '',
      priceListCurrency: json['price_list_currency'] as String? ?? '',
      sellingPriceList: json['selling_price_list'] as String? ?? '',
      paymentTermsTemplate: json['payment_terms_template'] as String?,
      currency: json['currency'] as String? ?? '',
      salesTeam: json['sales_team'] as List<dynamic>,
    );
  }
  final String customer;
  final String debitTo;
  final String dueDate;
  final String? customerAddress;
  final String? addressDisplay;
  final String? shippingAddressName;
  final String? shippingAddress;
  final String? companyAddress;
  final String? companyAddressDisplay;
  final String? taxCategory;
  final String contactPerson;
  final String contactDisplay;
  final String contactEmail;
  final String contactMobile;
  final String contactPhone;
  final String? contactDesignation;
  final String? contactDepartment;
  final String customerName;
  final String? customerGroup;
  final String? territory;
  final String language;
  final String priceListCurrency;
  final String sellingPriceList;
  final String? paymentTermsTemplate;
  final String currency;
  final List<dynamic> salesTeam;

  Map<String, dynamic> toJson() {
    return {
      'customer': customer,
      'debit_to': debitTo,
      'due_date': dueDate,
      'customer_address': customerAddress,
      'address_display': addressDisplay,
      'shipping_address_name': shippingAddressName,
      'shipping_address': shippingAddress,
      'company_address': companyAddress,
      'company_address_display': companyAddressDisplay,
      'tax_category': taxCategory,
      'contact_person': contactPerson,
      'contact_display': contactDisplay,
      'contact_email': contactEmail,
      'contact_mobile': contactMobile,
      'contact_phone': contactPhone,
      'contact_designation': contactDesignation,
      'contact_department': contactDepartment,
      'customer_name': customerName,
      'customer_group': customerGroup,
      'territory': territory,
      'language': language,
      'price_list_currency': priceListCurrency,
      'selling_price_list': sellingPriceList,
      'payment_terms_template': paymentTermsTemplate,
      'currency': currency,
      'sales_team': salesTeam,
    };
  }
}
