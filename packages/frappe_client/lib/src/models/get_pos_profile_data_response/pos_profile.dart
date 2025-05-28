import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:frappe_client/src/models/get_pos_profile_data_response/applicable_for_user.dart';
import 'package:frappe_client/src/models/get_pos_profile_data_response/customer_group.dart';
import 'package:frappe_client/src/models/get_pos_profile_data_response/item_group.dart';
import 'package:frappe_client/src/models/get_pos_profile_data_response/payment.dart';

class PosProfile extends Equatable {
  const PosProfile({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.company,
    this.customer,
    this.country,
    this.disabled,
    this.warehouse,
    this.campaign,
    this.companyAddress,
    this.hideImages,
    this.hideUnavailableItems,
    this.autoAddItemToCart,
    this.validateStockOnSave,
    this.updateStock,
    this.ignorePricingRule,
    this.allowRateChange,
    this.allowDiscountChange,
    this.printFormat,
    this.letterHead,
    this.tcName,
    this.selectPrintHeading,
    this.sellingPriceList,
    this.currency,
    this.writeOffAccount,
    this.writeOffCostCenter,
    this.writeOffLimit,
    this.accountForChangeAmount,
    this.disableRoundedTotal,
    this.incomeAccount,
    this.expenseAccount,
    this.taxesAndCharges,
    this.taxCategory,
    this.applyDiscountOn,
    this.costCenter,
    this.doctype,
    this.payments,
    this.itemGroups,
    this.applicableForUsers,
    this.customerGroups,
  });

  factory PosProfile.fromMap(Map<String, dynamic> data) => PosProfile(
        name: data['name'] as String?,
        owner: data['owner'] as String?,
        creation: data['creation'] as String?,
        modified: data['modified'] as String?,
        modifiedBy: data['modified_by'] as String?,
        docstatus: data['docstatus'] as int?,
        idx: data['idx'] as int?,
        company: data['company'] as String?,
        customer: data['customer'] as String?,
        country: data['country'] as String?,
        disabled: data['disabled'] as int?,
        warehouse: data['warehouse'] as String?,
        campaign: data['campaign'] as String?,
        companyAddress: data['company_address'] as String?,
        hideImages: data['hide_images'] as int?,
        hideUnavailableItems: data['hide_unavailable_items'] as int?,
        autoAddItemToCart: data['auto_add_item_to_cart'] as int?,
        validateStockOnSave: data['validate_stock_on_save'] as int?,
        updateStock: data['update_stock'] as int?,
        ignorePricingRule: data['ignore_pricing_rule'] as int?,
        allowRateChange: data['allow_rate_change'] as int?,
        allowDiscountChange: data['allow_discount_change'] as int?,
        printFormat: data['print_format'] as String?,
        letterHead: data['letter_head'] as String?,
        tcName: data['tc_name'] as String?,
        selectPrintHeading: data['select_print_heading'] as String?,
        sellingPriceList: data['selling_price_list'] as String?,
        currency: data['currency'] as String?,
        writeOffAccount: data['write_off_account'] as String?,
        writeOffCostCenter: data['write_off_cost_center'] as String?,
        writeOffLimit: data['write_off_limit'] as double?,
        accountForChangeAmount: data['account_for_change_amount'] as String?,
        disableRoundedTotal: data['disable_rounded_total'] as int?,
        incomeAccount: data['income_account'] as String?,
        expenseAccount: data['expense_account'] as String?,
        taxesAndCharges: data['taxes_and_charges'] as String?,
        taxCategory: data['tax_category'] as String?,
        applyDiscountOn: data['apply_discount_on'] as String?,
        costCenter: data['cost_center'] as String?,
        doctype: data['doctype'] as String?,
        payments: (data['payments'] as List<dynamic>?)
            ?.map((e) => Payment.fromMap(e as Map<String, dynamic>))
            .toList(),
        itemGroups: (data['item_groups'] as List<dynamic>?)
            ?.map((e) => ItemGroup.fromMap(e as Map<String, dynamic>))
            .toList(),
        applicableForUsers: (data['applicable_for_users'] as List<dynamic>?)
            ?.map((e) => ApplicableForUser.fromMap(e as Map<String, dynamic>))
            .toList(),
        customerGroups: (data['customer_groups'] as List<dynamic>?)
            ?.map((e) => CustomerGroup.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PosProfile].
  factory PosProfile.fromJson(String data) {
    return PosProfile.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? company;
  final String? customer;
  final String? country;
  final int? disabled;
  final String? warehouse;
  final String? campaign;
  final String? companyAddress;
  final int? hideImages;
  final int? hideUnavailableItems;
  final int? autoAddItemToCart;
  final int? validateStockOnSave;
  final int? updateStock;
  final int? ignorePricingRule;
  final int? allowRateChange;
  final int? allowDiscountChange;
  final String? printFormat;
  final String? letterHead;
  final String? tcName;
  final String? selectPrintHeading;
  final String? sellingPriceList;
  final String? currency;
  final String? writeOffAccount;
  final String? writeOffCostCenter;
  final double? writeOffLimit;
  final String? accountForChangeAmount;
  final int? disableRoundedTotal;
  final String? incomeAccount;
  final String? expenseAccount;
  final String? taxesAndCharges;
  final String? taxCategory;
  final String? applyDiscountOn;
  final String? costCenter;
  final String? doctype;
  final List<Payment>? payments;
  final List<ItemGroup>? itemGroups;
  final List<ApplicableForUser>? applicableForUsers;
  final List<CustomerGroup>? customerGroups;

  Map<String, dynamic> toMap() => {
        'name': name,
        'owner': owner,
        'creation': creation,
        'modified': modified,
        'modified_by': modifiedBy,
        'docstatus': docstatus,
        'idx': idx,
        'company': company,
        'customer': customer,
        'country': country,
        'disabled': disabled,
        'warehouse': warehouse,
        'campaign': campaign,
        'company_address': companyAddress,
        'hide_images': hideImages,
        'hide_unavailable_items': hideUnavailableItems,
        'auto_add_item_to_cart': autoAddItemToCart,
        'validate_stock_on_save': validateStockOnSave,
        'update_stock': updateStock,
        'ignore_pricing_rule': ignorePricingRule,
        'allow_rate_change': allowRateChange,
        'allow_discount_change': allowDiscountChange,
        'print_format': printFormat,
        'letter_head': letterHead,
        'tc_name': tcName,
        'select_print_heading': selectPrintHeading,
        'selling_price_list': sellingPriceList,
        'currency': currency,
        'write_off_account': writeOffAccount,
        'write_off_cost_center': writeOffCostCenter,
        'write_off_limit': writeOffLimit,
        'account_for_change_amount': accountForChangeAmount,
        'disable_rounded_total': disableRoundedTotal,
        'income_account': incomeAccount,
        'expense_account': expenseAccount,
        'taxes_and_charges': taxesAndCharges,
        'tax_category': taxCategory,
        'apply_discount_on': applyDiscountOn,
        'cost_center': costCenter,
        'doctype': doctype,
        'payments': payments?.map((e) => e.toMap()).toList(),
        'item_groups': itemGroups?.map((e) => e.toMap()).toList(),
        'applicable_for_users':
            applicableForUsers?.map((e) => e.toMap()).toList(),
        'customer_groups': customerGroups?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [PosProfile] to a JSON string.
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
      company,
      customer,
      country,
      disabled,
      warehouse,
      campaign,
      companyAddress,
      hideImages,
      hideUnavailableItems,
      autoAddItemToCart,
      validateStockOnSave,
      updateStock,
      ignorePricingRule,
      allowRateChange,
      allowDiscountChange,
      printFormat,
      letterHead,
      tcName,
      selectPrintHeading,
      sellingPriceList,
      currency,
      writeOffAccount,
      writeOffCostCenter,
      writeOffLimit,
      accountForChangeAmount,
      disableRoundedTotal,
      incomeAccount,
      expenseAccount,
      taxesAndCharges,
      taxCategory,
      applyDiscountOn,
      costCenter,
      doctype,
      payments,
      itemGroups,
      applicableForUsers,
      customerGroups,
    ];
  }
}
