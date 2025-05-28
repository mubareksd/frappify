import 'dart:convert';

import 'package:app_logger/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:frappe_client/src/models/models.dart';
import 'package:frappe_client/src/network_client.dart';
import 'package:frappe_dart/frappe_dart.dart';

/// Frappe client
///
/// This is a client for the Frappe API
///
/// [baseUrl] is the base URL of the Frappe API
/// [cookie] is the cookie to use for the Frappe API
///
class FrappeClient extends FrappeV15 {
  /// Frappe client factory
  ///
  /// [baseUrl] is the base URL of the Frappe API
  /// [cookie] is the cookie to use for the Frappe API
  ///
  /// Returns a Frappe client
  factory FrappeClient({
    required String baseUrl,
    String? cookie,
  }) {
    return FrappeClient._(
      baseUrl: baseUrl,
      cookie: cookie,
      dio: NetworkClient().dio,
    );
  }

  FrappeClient._({
    required super.baseUrl,
    required super.dio,
    super.cookie,
  }) {
    NetworkClient().updateBaseUrl(baseUrl);
    if (cookie != null) {
      NetworkClient().updateCookie(cookie);
    }
  }

  @override
  set cookie(String? newCookie) {
    super.cookie = newCookie;
    NetworkClient().updateCookie(newCookie);
  }

  @override
  set baseUrl(String newBaseUrl) {
    super.baseUrl = newBaseUrl;
    NetworkClient().updateBaseUrl(newBaseUrl);
  }

  /// Get fiscal year
  ///
  /// [date] is the date to get the fiscal year of
  ///
  /// Returns a map of the fiscal year
  Future<GetFiscalYearResponse> getFiscalYear({
    required DateTime date,
  }) async {
    final url = '$baseUrl/api/method/erpnext.accounts.utils.get_fiscal_year';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: {
          'date': date.toIso8601String(),
          'boolean': 'false',
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetFiscalYearResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to get fiscal year. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting fiscal year',
      );
      throw Exception('An error occurred while getting fiscal year: $e');
    }
  }

  Future<Map<String, dynamic>> getDoc(String doctype, String name) async {
    final url = '$baseUrl/api/method/frappe.desk.form.load.getdoc';
    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'doctype': doctype,
          'name': name,
        },
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception(
          'Failed to get doc. Response Status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e) {
      throw Exception(
        '''An unknown error occurred while retrieving doc: $e''',
      );
    }
  }

  Future<CheckOpeningEntryResponse> checkOpeningEntry(
    CheckOpeningEntryRequest checkOpeningEntryRequest,
  ) async {
    final url =
        '$baseUrl/api/method/erpnext.selling.page.point_of_sale.point_of_sale.check_opening_entry';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: checkOpeningEntryRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return CheckOpeningEntryResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to check opening entry. HTTP Status: ${response.statusCode}, data: ${response.data}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while checking the opening entry',
      );
      throw Exception('An error occurred while checking the opening entry: $e');
    }
  }

  Future<GetItemsResponse> getItems(
    GetItemsRequest getItemsRequest,
  ) async {
    final url =
        '$baseUrl/api/method/erpnext.selling.page.point_of_sale.point_of_sale.get_items';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: getItemsRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data!['message'] is List) {
          return const GetItemsResponse();
        } else {
          return GetItemsResponse.fromMap(response.data!);
        }
      } else {
        throw Exception(
          'Failed to get items. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting items',
      );
      throw Exception('An error occurred while getting items: $e');
    }
  }

  Future<CreateOpeningVoucherResponse> createOpeningVoucher(
    CreateOpeningVoucherRequest createOpeningVoucherRequest,
  ) async {
    final url =
        '$baseUrl/api/method/erpnext.selling.page.point_of_sale.point_of_sale.create_opening_voucher';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: createOpeningVoucherRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return CreateOpeningVoucherResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to create opening voucher. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while creating opening voucher',
      );
      throw Exception('An error occurred while creating opening voucher: $e');
    }
  }

  Future<GetPastOrderListResponse> getPastOrderList({
    required String searchTerm,
    required String status,
  }) async {
    final url =
        '$baseUrl/api/method/erpnext.selling.page.point_of_sale.point_of_sale.get_past_order_list';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: {
          'search_term': searchTerm,
          'status': status,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetPastOrderListResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to get past order list. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting past order list',
      );
      throw Exception('An error occurred while getting past order list: $e');
    }
  }

  Future<Map<String, dynamic>> setCustomerInfo(
    SetCustomerInfoRequest setCustomerInfoRequest,
  ) async {
    final url =
        '$baseUrl/api/method/erpnext.selling.page.point_of_sale.point_of_sale.set_customer_info';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: setCustomerInfoRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception(
          'Failed to set customer info. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while setting customer info',
      );
      throw Exception('An error occurred while setting customer info: $e');
    }
  }

  Future<GetPosProfileDataResponse> getPosProfileData({
    required String posProfile,
  }) async {
    final url =
        '$baseUrl/api/method/erpnext.selling.page.point_of_sale.point_of_sale.get_pos_profile_data';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: {
          'pos_profile': posProfile,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetPosProfileDataResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to get POS profile data. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting POS profile data',
      );
      throw Exception('An error occurred while getting POS profile data: $e');
    }
  }

  Future<GetPartyDetailsResponse> getPartyDetails(
    GetPartyDetailsRequest getPartyDetailsRequest,
  ) async {
    final url = '$baseUrl/api/method/erpnext.accounts.party.get_party_details';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: getPartyDetailsRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetPartyDetailsResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to get party details. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting party details',
      );
      throw Exception('An error occurred while getting party details: $e');
    }
  }

  Future<GetEnableStockUomEditingResponse> getEnableStockUOMEditing() async {
    final url =
        '$baseUrl/api/method/erpnext.stock.doctype.stock_settings.stock_settings.get_enable_stock_uom_editing';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        options: Options(
          headers: {
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetEnableStockUomEditingResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to get enable stock UOM editing. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting enable stock UOM editing',
      );
      throw Exception(
        'An error occurred while getting enable stock UOM editing: $e',
      );
    }
  }

  Future<GetStockAvailabilityResponse> getStockAvailability({
    required String itemCode,
    required String warehouse,
  }) async {
    final url =
        '$baseUrl/api/method/erpnext.accounts.doctype.pos_invoice.pos_invoice.get_stock_availability';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: {
          'item_code': itemCode,
          'warehouse': warehouse,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetStockAvailabilityResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to get stock availability. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting stock availability',
      );
      throw Exception('An error occurred while getting stock availability: $e');
    }
  }

  Future<ApplyPriceListResponse> applyPriceList(
    ApplyPriceListRequest applyPriceListRequest,
  ) async {
    final url =
        '$baseUrl/api/method/erpnext.stock.get_item_details.apply_price_list';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: applyPriceListRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return ApplyPriceListResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to apply price list. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while applying price list',
      );
      throw Exception('An error occurred while applying price list: $e');
    }
  }

  Future<ApplyPricingRuleResponse> applyPricingRule(
    ApplyPricingRuleRequest applyPricingRuleRequest,
  ) async {
    final url =
        '$baseUrl/api/method/erpnext.accounts.doctype.pricing_rule.pricing_rule.apply_pricing_rule';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: applyPricingRuleRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return ApplyPricingRuleResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to apply pricing rule. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while applying pricing rule',
      );
      throw Exception('An error occurred while applying pricing rule: $e');
    }
  }

  Future<GetPosInvoicesResponse> getPOSInvoices(
    GetPosInvoicesRequest getPosInvoicesRequest,
  ) async {
    final url =
        '$baseUrl/api/method/erpnext.accounts.doctype.pos_closing_entry.pos_closing_entry.get_pos_invoices';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        data: getPosInvoicesRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (cookie != null) 'Cookie': cookie,
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetPosInvoicesResponse.fromMap(response.data!);
      } else {
        throw Exception(
          'Failed to get pos invoices. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting pos invoices',
      );
      throw Exception('An error occurred while getting pos invoices: $e');
    }
  }

  Future<Map<String, dynamic>> getItemDetails({
    required PosInvoice doc,
    required Map<String, dynamic> arg,
  }) async {
    final url =
        '$baseUrl/api/method/erpnext.stock.get_item_details.get_item_details';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Cookie': cookie ?? '',
          },
        ),
        data: {
          'doc': doc.toJson(),
          'args': jsonEncode(arg),
        },
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception(
          'Failed to get list. HTTP Status: ${response.statusCode}, Response: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while fetching the list',
      );
      throw Exception(
        'An error occurred while fetching the list: $e',
      );
    }
  }

  Future<Map<String, dynamic>> onSubmitPosEntry({
    required balanceDetails,
    required String posProfile,
    required String company,
  }) async {
    final url =
        '$baseUrl/api/method/erpnext.selling.page.point_of_sale.point_of_sale.create_opening_voucher';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Cookie': cookie ?? '',
          },
        ),
        data: {
          'pos_profile': posProfile,
          'company': company,
          'balance_details': jsonEncode(
            balanceDetails.map((detail) => detail.toJson()).toList(),
          ),
        },
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception(
          'Failed to submit POS entry. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while submitting POS entry',
      );

      throw Exception(
        'An error occurred while submitting POS entry: $e',
      );
    }
  }

  Future<Map<String, dynamic>> getDefaultTaxesAndCharges({
    required String company,
  }) async {
    final url =
        '$baseUrl/api/method/erpnext.controllers.accounts_controller.get_default_taxes_and_charges';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Cookie': cookie ?? '',
          },
        ),
        data: {
          'master_doctype': 'Sales Taxes and Charges Template',
          'company': company,
        },
      );

      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw Exception(
          'Failed to get default taxes and charges. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while getting default taxes and charges',
      );
      throw Exception(
        'An error occurred while getting default taxes and charges: $e',
      );
    }
  }

  Future<PosInvoice> makeSalesReturn({
    required String sourceName,
    required PosInvoice targetDoc,
  }) async {
    final url =
        '$baseUrl/api/method/erpnext.accounts.doctype.pos_invoice.pos_invoice.make_sales_return';

    try {
      final response = await dio.post<Map<String, dynamic>>(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Cookie': cookie ?? '',
          },
        ),
        data: {
          'source_name': sourceName,
          'target_doc': targetDoc.toMap(),
        },
      );

      if (response.statusCode == 200) {
        return PosInvoice.fromMap(
          response.data!['message'] as Map<String, dynamic>,
        );
      } else {
        throw Exception(
          'Failed to make sales return. HTTP Status: ${response.statusCode}, data: ${response.data!}',
        );
      }
    } on DioException catch (e) {
      throw Exception(handleDioError(e));
    } catch (e, stack) {
      await AppLogger.reportError(
        e,
        stack,
        'An error occurred while making sales return',
      );
      throw Exception('An error occurred while making sales return: $e');
    }
  }
}
