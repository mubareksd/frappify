import 'dart:convert';

import 'package:frappe_client/src/models/apply_pricing_rule_request/item.dart';
import 'package:frappe_client/src/models/apply_pricing_rule_request/payment.dart';

class Doc {
  Doc({
    this.docstatus,
    this.doctype,
    this.name,
    this.islocal,
    this.unsaved,
    this.owner,
    this.namingSeries,
    this.isPos,
    this.isReturn,
    this.updateBilledAmountInSalesOrder,
    this.updateBilledAmountInDeliveryNote,
    this.company,
    this.postingDate,
    this.setPostingTime,
    this.currency,
    this.sellingPriceList,
    this.priceListCurrency,
    this.ignorePricingRule,
    this.updateStock,
    this.items,
    this.pricingRules,
    this.packedItems,
    this.timesheets,
    this.totalBillingAmount,
    this.taxes,
    this.redeemLoyaltyPoints,
    this.applyDiscountOn,
    this.allocateAdvancesAutomatically,
    this.advances,
    this.paymentSchedule,
    this.payments,
    this.writeOffOutstandingAmountAutomatically,
    this.groupSameItems,
    this.isDiscounted,
    this.status,
    this.partyAccountCurrency,
    this.isOpening,
    this.salesTeam,
    this.posProfile,
    this.setWarehouse,
    this.idx,
    this.customApplyTds,
    this.conversionRate,
    this.plcConversionRate,
    this.totalQty,
    this.baseTotal,
    this.baseNetTotal,
    this.total,
    this.netTotal,
    this.totalNetWeight,
    this.baseTotalTaxesAndCharges,
    this.totalTaxesAndCharges,
    this.loyaltyPoints,
    this.loyaltyAmount,
    this.baseDiscountAmount,
    this.additionalDiscountPercentage,
    this.discountAmount,
    this.baseGrandTotal,
    this.baseRoundingAdjustment,
    this.baseRoundedTotal,
    this.grandTotal,
    this.roundingAdjustment,
    this.roundedTotal,
    this.totalAdvance,
    this.outstandingAmount,
    this.basePaidAmount,
    this.paidAmount,
    this.baseChangeAmount,
    this.changeAmount,
    this.accountForChangeAmount,
    this.writeOffAmount,
    this.baseWriteOffAmount,
    this.writeOffAccount,
    this.writeOffCostCenter,
    this.debitTo,
    this.amountEligibleForCommission,
    this.commissionRate,
    this.totalCommission,
    this.campaign,
    this.inWords,
    this.baseInWords,
    this.customer,
    this.customerName,
    this.customTaxWithholdingCategory,
    this.loyaltyProgram,
    this.taxesAndCharges,
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
    this.customerGroup,
    this.territory,
    this.language,
    this.paymentTermsTemplate,
    this.postingTime,
  });

  factory Doc.fromMap(Map<String, dynamic> data) => Doc(
        docstatus: data['docstatus'] as int?,
        doctype: data['doctype'] as String?,
        name: data['name'] as String?,
        islocal: data['__islocal'] as int?,
        unsaved: data['__unsaved'] as int?,
        owner: data['owner'] as String?,
        namingSeries: data['naming_series'] as String?,
        isPos: data['is_pos'] as int?,
        isReturn: data['is_return'] as int?,
        updateBilledAmountInSalesOrder:
            data['update_billed_amount_in_sales_order'] as int?,
        updateBilledAmountInDeliveryNote:
            data['update_billed_amount_in_delivery_note'] as int?,
        company: data['company'] as String?,
        postingDate: data['posting_date'] as String?,
        setPostingTime: data['set_posting_time'] as int?,
        currency: data['currency'] as String?,
        sellingPriceList: data['selling_price_list'] as String?,
        priceListCurrency: data['price_list_currency'] as String?,
        ignorePricingRule: data['ignore_pricing_rule'] as int?,
        updateStock: data['update_stock'] as int?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
        pricingRules: data['pricing_rules'] as List<dynamic>?,
        packedItems: data['packed_items'] as List<dynamic>?,
        timesheets: data['timesheets'] as List<dynamic>?,
        totalBillingAmount: data['total_billing_amount'] as int?,
        taxes: data['taxes'] as List<dynamic>?,
        redeemLoyaltyPoints: data['redeem_loyalty_points'] as int?,
        applyDiscountOn: data['apply_discount_on'] as String?,
        allocateAdvancesAutomatically:
            data['allocate_advances_automatically'] as int?,
        advances: data['advances'] as List<dynamic>?,
        paymentSchedule: data['payment_schedule'] as List<dynamic>?,
        payments: (data['payments'] as List<dynamic>?)
            ?.map((e) => Payment.fromMap(e as Map<String, dynamic>))
            .toList(),
        writeOffOutstandingAmountAutomatically:
            data['write_off_outstanding_amount_automatically'] as int?,
        groupSameItems: data['group_same_items'] as int?,
        isDiscounted: data['is_discounted'] as int?,
        status: data['status'] as String?,
        partyAccountCurrency: data['party_account_currency'] as String?,
        isOpening: data['is_opening'] as String?,
        salesTeam: data['sales_team'] as List<dynamic>?,
        posProfile: data['pos_profile'] as String?,
        setWarehouse: data['set_warehouse'] as String?,
        idx: data['idx'] as int?,
        conversionRate: data['conversion_rate'] as int?,
        plcConversionRate: data['plc_conversion_rate'] as int?,
        totalQty: data['total_qty'] as int?,
        baseTotal: data['base_total'] as int?,
        baseNetTotal: data['base_net_total'] as int?,
        total: data['total'] as int?,
        netTotal: data['net_total'] as int?,
        totalNetWeight: data['total_net_weight'] as int?,
        baseTotalTaxesAndCharges: data['base_total_taxes_and_charges'] as int?,
        totalTaxesAndCharges: data['total_taxes_and_charges'] as int?,
        loyaltyPoints: data['loyalty_points'] as int?,
        loyaltyAmount: data['loyalty_amount'] as int?,
        baseDiscountAmount: data['base_discount_amount'] as int?,
        additionalDiscountPercentage:
            data['additional_discount_percentage'] as int?,
        discountAmount: data['discount_amount'] as int?,
        baseGrandTotal: data['base_grand_total'] as int?,
        baseRoundingAdjustment: data['base_rounding_adjustment'] as int?,
        baseRoundedTotal: data['base_rounded_total'] as int?,
        grandTotal: data['grand_total'] as int?,
        roundingAdjustment: data['rounding_adjustment'] as int?,
        roundedTotal: data['rounded_total'] as int?,
        totalAdvance: data['total_advance'] as int?,
        outstandingAmount: data['outstanding_amount'] as int?,
        basePaidAmount: data['base_paid_amount'] as int?,
        paidAmount: data['paid_amount'] as int?,
        baseChangeAmount: data['base_change_amount'] as int?,
        changeAmount: data['change_amount'] as int?,
        accountForChangeAmount: data['account_for_change_amount'] as String?,
        writeOffAmount: data['write_off_amount'] as int?,
        baseWriteOffAmount: data['base_write_off_amount'] as int?,
        writeOffAccount: data['write_off_account'] as String?,
        writeOffCostCenter: data['write_off_cost_center'] as String?,
        debitTo: data['debit_to'] as String?,
        amountEligibleForCommission:
            data['amount_eligible_for_commission'] as int?,
        commissionRate: data['commission_rate'] as int?,
        totalCommission: data['total_commission'] as int?,
        campaign: data['campaign'] as dynamic,
        inWords: data['in_words'] as String?,
        baseInWords: data['base_in_words'] as String?,
        customer: data['customer'] as String?,
        customerName: data['customer_name'] as String?,
        loyaltyProgram: data['loyalty_program'] as dynamic,
        taxesAndCharges: data['taxes_and_charges'] as String?,
        dueDate: data['due_date'] as String?,
        customerAddress: data['customer_address'] as dynamic,
        addressDisplay: data['address_display'] as dynamic,
        shippingAddressName: data['shipping_address_name'] as dynamic,
        shippingAddress: data['shipping_address'] as dynamic,
        companyAddress: data['company_address'] as dynamic,
        companyAddressDisplay: data['company_address_display'] as dynamic,
        taxCategory: data['tax_category'] as dynamic,
        contactPerson: data['contact_person'] as dynamic,
        contactDisplay: data['contact_display'] as dynamic,
        contactEmail: data['contact_email'] as dynamic,
        contactMobile: data['contact_mobile'] as dynamic,
        customerGroup: data['customer_group'] as dynamic,
        territory: data['territory'] as dynamic,
        language: data['language'] as String?,
        paymentTermsTemplate: data['payment_terms_template'] as dynamic,
        postingTime: data['posting_time'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Doc].
  factory Doc.fromJson(String data) {
    return Doc.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  int? docstatus;
  String? doctype;
  String? name;
  int? islocal;
  int? unsaved;
  String? owner;
  String? namingSeries;
  int? isPos;
  int? isReturn;
  int? updateBilledAmountInSalesOrder;
  int? updateBilledAmountInDeliveryNote;
  String? company;
  String? postingDate;
  int? setPostingTime;
  String? currency;
  String? sellingPriceList;
  String? priceListCurrency;
  int? ignorePricingRule;
  int? updateStock;
  List<Item>? items;
  List<dynamic>? pricingRules;
  List<dynamic>? packedItems;
  List<dynamic>? timesheets;
  int? totalBillingAmount;
  List<dynamic>? taxes;
  int? redeemLoyaltyPoints;
  String? applyDiscountOn;
  int? allocateAdvancesAutomatically;
  List<dynamic>? advances;
  List<dynamic>? paymentSchedule;
  List<Payment>? payments;
  int? writeOffOutstandingAmountAutomatically;
  int? groupSameItems;
  int? isDiscounted;
  String? status;
  String? partyAccountCurrency;
  String? isOpening;
  List<dynamic>? salesTeam;
  String? posProfile;
  String? setWarehouse;
  int? idx;
  int? customApplyTds;
  int? conversionRate;
  int? plcConversionRate;
  int? totalQty;
  int? baseTotal;
  int? baseNetTotal;
  int? total;
  int? netTotal;
  int? totalNetWeight;
  int? baseTotalTaxesAndCharges;
  int? totalTaxesAndCharges;
  int? loyaltyPoints;
  int? loyaltyAmount;
  int? baseDiscountAmount;
  int? additionalDiscountPercentage;
  int? discountAmount;
  int? baseGrandTotal;
  int? baseRoundingAdjustment;
  int? baseRoundedTotal;
  int? grandTotal;
  int? roundingAdjustment;
  int? roundedTotal;
  int? totalAdvance;
  int? outstandingAmount;
  int? basePaidAmount;
  int? paidAmount;
  int? baseChangeAmount;
  int? changeAmount;
  String? accountForChangeAmount;
  int? writeOffAmount;
  int? baseWriteOffAmount;
  String? writeOffAccount;
  String? writeOffCostCenter;
  String? debitTo;
  int? amountEligibleForCommission;
  int? commissionRate;
  int? totalCommission;
  dynamic campaign;
  String? inWords;
  String? baseInWords;
  String? customer;
  String? customerName;
  String? customTaxWithholdingCategory;
  dynamic loyaltyProgram;
  String? taxesAndCharges;
  String? dueDate;
  dynamic customerAddress;
  dynamic addressDisplay;
  dynamic shippingAddressName;
  dynamic shippingAddress;
  dynamic companyAddress;
  dynamic companyAddressDisplay;
  dynamic taxCategory;
  dynamic contactPerson;
  dynamic contactDisplay;
  dynamic contactEmail;
  dynamic contactMobile;
  dynamic customerGroup;
  dynamic territory;
  String? language;
  dynamic paymentTermsTemplate;
  String? postingTime;

  Map<String, dynamic> toMap() => {
        'docstatus': docstatus,
        'doctype': doctype,
        'name': name,
        '__islocal': islocal,
        '__unsaved': unsaved,
        'owner': owner,
        'naming_series': namingSeries,
        'is_pos': isPos,
        'is_return': isReturn,
        'update_billed_amount_in_sales_order': updateBilledAmountInSalesOrder,
        'update_billed_amount_in_delivery_note':
            updateBilledAmountInDeliveryNote,
        'company': company,
        'posting_date': postingDate,
        'set_posting_time': setPostingTime,
        'currency': currency,
        'selling_price_list': sellingPriceList,
        'price_list_currency': priceListCurrency,
        'ignore_pricing_rule': ignorePricingRule,
        'update_stock': updateStock,
        'items': items?.map((e) => e.toMap()).toList(),
        'pricing_rules': pricingRules,
        'packed_items': packedItems,
        'timesheets': timesheets,
        'total_billing_amount': totalBillingAmount,
        'taxes': taxes,
        'redeem_loyalty_points': redeemLoyaltyPoints,
        'apply_discount_on': applyDiscountOn,
        'allocate_advances_automatically': allocateAdvancesAutomatically,
        'advances': advances,
        'payment_schedule': paymentSchedule,
        'payments': payments?.map((e) => e.toMap()).toList(),
        'write_off_outstanding_amount_automatically':
            writeOffOutstandingAmountAutomatically,
        'group_same_items': groupSameItems,
        'is_discounted': isDiscounted,
        'status': status,
        'party_account_currency': partyAccountCurrency,
        'is_opening': isOpening,
        'sales_team': salesTeam,
        'pos_profile': posProfile,
        'set_warehouse': setWarehouse,
        'idx': idx,
        'conversion_rate': conversionRate,
        'plc_conversion_rate': plcConversionRate,
        'total_qty': totalQty,
        'base_total': baseTotal,
        'base_net_total': baseNetTotal,
        'total': total,
        'net_total': netTotal,
        'total_net_weight': totalNetWeight,
        'base_total_taxes_and_charges': baseTotalTaxesAndCharges,
        'total_taxes_and_charges': totalTaxesAndCharges,
        'loyalty_points': loyaltyPoints,
        'loyalty_amount': loyaltyAmount,
        'base_discount_amount': baseDiscountAmount,
        'additional_discount_percentage': additionalDiscountPercentage,
        'discount_amount': discountAmount,
        'base_grand_total': baseGrandTotal,
        'base_rounding_adjustment': baseRoundingAdjustment,
        'base_rounded_total': baseRoundedTotal,
        'grand_total': grandTotal,
        'rounding_adjustment': roundingAdjustment,
        'rounded_total': roundedTotal,
        'total_advance': totalAdvance,
        'outstanding_amount': outstandingAmount,
        'base_paid_amount': basePaidAmount,
        'paid_amount': paidAmount,
        'base_change_amount': baseChangeAmount,
        'change_amount': changeAmount,
        'account_for_change_amount': accountForChangeAmount,
        'write_off_amount': writeOffAmount,
        'base_write_off_amount': baseWriteOffAmount,
        'write_off_account': writeOffAccount,
        'write_off_cost_center': writeOffCostCenter,
        'debit_to': debitTo,
        'amount_eligible_for_commission': amountEligibleForCommission,
        'commission_rate': commissionRate,
        'total_commission': totalCommission,
        'campaign': campaign,
        'in_words': inWords,
        'base_in_words': baseInWords,
        'customer': customer,
        'customer_name': customerName,
        'loyalty_program': loyaltyProgram,
        'taxes_and_charges': taxesAndCharges,
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
        'customer_group': customerGroup,
        'territory': territory,
        'language': language,
        'payment_terms_template': paymentTermsTemplate,
        'posting_time': postingTime,
      };

  /// `dart:convert`
  ///
  /// Converts [Doc] to a JSON string.
  String toJson() => json.encode(toMap());
}
