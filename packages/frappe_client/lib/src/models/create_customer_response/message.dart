import 'dart:convert';

class Message {
  Message({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.namingSeries,
    this.salutation,
    this.customerName,
    this.customerType,
    this.customerGroup,
    this.territory,
    this.gender,
    this.leadName,
    this.opportunityName,
    this.prospectName,
    this.accountManager,
    this.image,
    this.defaultCurrency,
    this.defaultBankAccount,
    this.defaultPriceList,
    this.isInternalCustomer,
    this.representsCompany,
    this.marketSegment,
    this.industry,
    this.customerPosId,
    this.website,
    this.language,
    this.customerDetails,
    this.customerPrimaryAddress,
    this.primaryAddress,
    this.customerPrimaryContact,
    this.mobileNo,
    this.emailId,
    this.taxId,
    this.taxCategory,
    this.taxWithholdingCategory,
    this.paymentTerms,
    this.loyaltyProgram,
    this.loyaltyProgramTier,
    this.defaultSalesPartner,
    this.defaultCommissionRate,
    this.soRequired,
    this.dnRequired,
    this.isFrozen,
    this.disabled,
    this.doctype,
    this.companies,
    this.accounts,
    this.portalUsers,
    this.salesTeam,
    this.creditLimits,
    this.runLinkTriggers,
  });

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        name: data['name'] as String?,
        owner: data['owner'] as String?,
        creation: data['creation'] as String?,
        modified: data['modified'] as String?,
        modifiedBy: data['modified_by'] as String?,
        docstatus: data['docstatus'] as int?,
        idx: data['idx'] as int?,
        namingSeries: data['naming_series'] as String?,
        salutation: data['salutation'] as dynamic,
        customerName: data['customer_name'] as String?,
        customerType: data['customer_type'] as String?,
        customerGroup: data['customer_group'] as dynamic,
        territory: data['territory'] as dynamic,
        gender: data['gender'] as dynamic,
        leadName: data['lead_name'] as dynamic,
        opportunityName: data['opportunity_name'] as dynamic,
        prospectName: data['prospect_name'] as dynamic,
        accountManager: data['account_manager'] as dynamic,
        image: data['image'] as dynamic,
        defaultCurrency: data['default_currency'] as dynamic,
        defaultBankAccount: data['default_bank_account'] as dynamic,
        defaultPriceList: data['default_price_list'] as dynamic,
        isInternalCustomer: data['is_internal_customer'] as int?,
        representsCompany: data['represents_company'] as dynamic,
        marketSegment: data['market_segment'] as dynamic,
        industry: data['industry'] as dynamic,
        customerPosId: data['customer_pos_id'] as dynamic,
        website: data['website'] as dynamic,
        language: data['language'] as String?,
        customerDetails: data['customer_details'] as dynamic,
        customerPrimaryAddress: data['customer_primary_address'] as String?,
        primaryAddress: data['primary_address'] as String?,
        customerPrimaryContact: data['customer_primary_contact'] as String?,
        mobileNo: data['mobile_no'] as String?,
        emailId: data['email_id'] as String?,
        taxId: data['tax_id'] as dynamic,
        taxCategory: data['tax_category'] as dynamic,
        taxWithholdingCategory: data['tax_withholding_category'] as dynamic,
        paymentTerms: data['payment_terms'] as dynamic,
        loyaltyProgram: data['loyalty_program'] as dynamic,
        loyaltyProgramTier: data['loyalty_program_tier'] as dynamic,
        defaultSalesPartner: data['default_sales_partner'] as dynamic,
        defaultCommissionRate: data['default_commission_rate'] as int?,
        soRequired: data['so_required'] as int?,
        dnRequired: data['dn_required'] as int?,
        isFrozen: data['is_frozen'] as int?,
        disabled: data['disabled'] as int?,
        doctype: data['doctype'] as String?,
        companies: data['companies'] as List<dynamic>?,
        accounts: data['accounts'] as List<dynamic>?,
        portalUsers: data['portal_users'] as List<dynamic>?,
        salesTeam: data['sales_team'] as List<dynamic>?,
        creditLimits: data['credit_limits'] as List<dynamic>?,
        runLinkTriggers: data['__run_link_triggers'] as int?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? namingSeries;
  dynamic salutation;
  String? customerName;
  String? customerType;
  dynamic customerGroup;
  dynamic territory;
  dynamic gender;
  dynamic leadName;
  dynamic opportunityName;
  dynamic prospectName;
  dynamic accountManager;
  dynamic image;
  dynamic defaultCurrency;
  dynamic defaultBankAccount;
  dynamic defaultPriceList;
  int? isInternalCustomer;
  dynamic representsCompany;
  dynamic marketSegment;
  dynamic industry;
  dynamic customerPosId;
  dynamic website;
  String? language;
  dynamic customerDetails;
  String? customerPrimaryAddress;
  String? primaryAddress;
  String? customerPrimaryContact;
  String? mobileNo;
  String? emailId;
  dynamic taxId;
  dynamic taxCategory;
  dynamic taxWithholdingCategory;
  dynamic paymentTerms;
  dynamic loyaltyProgram;
  dynamic loyaltyProgramTier;
  dynamic defaultSalesPartner;
  int? defaultCommissionRate;
  int? soRequired;
  int? dnRequired;
  int? isFrozen;
  int? disabled;
  String? doctype;
  List<dynamic>? companies;
  List<dynamic>? accounts;
  List<dynamic>? portalUsers;
  List<dynamic>? salesTeam;
  List<dynamic>? creditLimits;
  int? runLinkTriggers;

  Map<String, dynamic> toMap() => {
        'name': name,
        'owner': owner,
        'creation': creation,
        'modified': modified,
        'modified_by': modifiedBy,
        'docstatus': docstatus,
        'idx': idx,
        'naming_series': namingSeries,
        'salutation': salutation,
        'customer_name': customerName,
        'customer_type': customerType,
        'customer_group': customerGroup,
        'territory': territory,
        'gender': gender,
        'lead_name': leadName,
        'opportunity_name': opportunityName,
        'prospect_name': prospectName,
        'account_manager': accountManager,
        'image': image,
        'default_currency': defaultCurrency,
        'default_bank_account': defaultBankAccount,
        'default_price_list': defaultPriceList,
        'is_internal_customer': isInternalCustomer,
        'represents_company': representsCompany,
        'market_segment': marketSegment,
        'industry': industry,
        'customer_pos_id': customerPosId,
        'website': website,
        'language': language,
        'customer_details': customerDetails,
        'customer_primary_address': customerPrimaryAddress,
        'primary_address': primaryAddress,
        'customer_primary_contact': customerPrimaryContact,
        'mobile_no': mobileNo,
        'email_id': emailId,
        'tax_id': taxId,
        'tax_category': taxCategory,
        'tax_withholding_category': taxWithholdingCategory,
        'payment_terms': paymentTerms,
        'loyalty_program': loyaltyProgram,
        'loyalty_program_tier': loyaltyProgramTier,
        'default_sales_partner': defaultSalesPartner,
        'default_commission_rate': defaultCommissionRate,
        'so_required': soRequired,
        'dn_required': dnRequired,
        'is_frozen': isFrozen,
        'disabled': disabled,
        'doctype': doctype,
        'companies': companies,
        'accounts': accounts,
        'portal_users': portalUsers,
        'sales_team': salesTeam,
        'credit_limits': creditLimits,
        '__run_link_triggers': runLinkTriggers,
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());
}
