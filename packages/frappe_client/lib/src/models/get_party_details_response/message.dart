import 'dart:convert';

class Message {
  Message({
    this.customer,
    this.debitTo,
    this.dueDate,
    this.customerAddress,
    this.addressDisplay,
    this.shippingAddressName,
    this.shippingAddress,
    this.companyAddress,
    this.companyAddressDisplay,
    this.taxCategory,
    this.contactPerson,
    this.contactDisplay,
    this.contactEmail,
    this.contactMobile,
    this.contactPhone,
    this.contactDesignation,
    this.contactDepartment,
    this.customerName,
    this.customerGroup,
    this.territory,
    this.language,
    this.priceListCurrency,
    this.sellingPriceList,
    this.paymentTermsTemplate,
    this.currency,
    this.taxId,
  });

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        customer: data['customer'] as String?,
        debitTo: data['debit_to'] as String?,
        dueDate: data['due_date'] as String?,
        customerAddress: data['customer_address'] as dynamic,
        addressDisplay: data['address_display'] as dynamic,
        shippingAddressName: data['shipping_address_name'] as dynamic,
        shippingAddress: data['shipping_address'] as dynamic,
        companyAddress: data['company_address'] as dynamic,
        companyAddressDisplay: data['company_address_display'] as dynamic,
        taxCategory: data['tax_category'] as String?,
        contactPerson: data['contact_person'] as dynamic,
        contactDisplay: data['contact_display'] as dynamic,
        contactEmail: data['contact_email'] as String?,
        contactMobile: data['contact_mobile'] as String?,
        contactPhone: data['contact_phone'] as dynamic,
        contactDesignation: data['contact_designation'] as dynamic,
        contactDepartment: data['contact_department'] as dynamic,
        customerName: data['customer_name'] as String?,
        customerGroup: data['customer_group'] as String?,
        territory: data['territory'] as String?,
        language: data['language'] as String?,
        priceListCurrency: data['price_list_currency'] as String?,
        sellingPriceList: data['selling_price_list'] as String?,
        paymentTermsTemplate: data['payment_terms_template'] as dynamic,
        currency: data['currency'] as String?,
        taxId: data['tax_id'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? customer;
  String? debitTo;
  String? dueDate;
  dynamic customerAddress;
  dynamic addressDisplay;
  dynamic shippingAddressName;
  dynamic shippingAddress;
  dynamic companyAddress;
  dynamic companyAddressDisplay;
  String? taxCategory;
  dynamic contactPerson;
  dynamic contactDisplay;
  String? contactEmail;
  String? contactMobile;
  dynamic contactPhone;
  dynamic contactDesignation;
  dynamic contactDepartment;
  String? customerName;
  String? customerGroup;
  String? territory;
  String? language;
  String? priceListCurrency;
  String? sellingPriceList;
  dynamic paymentTermsTemplate;
  String? currency;
  String? taxId;

  Map<String, dynamic> toMap() => {
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
        'tax_id': taxId,
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());
}
