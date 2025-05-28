import 'dart:convert';

class GetItemsRequest {
  GetItemsRequest({
    this.start,
    this.pageLength,
    this.priceList,
    this.itemGroup,
    this.searchTerm,
    this.posProfile,
  });

  factory GetItemsRequest.fromMap(Map<String, dynamic> data) {
    return GetItemsRequest(
      start: data['start'] as String?,
      pageLength: data['page_length'] as String?,
      priceList: data['price_list'] as String?,
      itemGroup: data['item_group'] as String?,
      searchTerm: data['search_term'] as String?,
      posProfile: data['pos_profile'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetItemsRequest].
  factory GetItemsRequest.fromJson(String data) {
    return GetItemsRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? start;
  String? pageLength;
  String? priceList;
  String? itemGroup;
  String? searchTerm;
  String? posProfile;

  Map<String, dynamic> toMap() => {
        'start': start,
        'page_length': pageLength,
        'price_list': priceList,
        'item_group': itemGroup,
        'search_term': searchTerm,
        'pos_profile': posProfile,
      };

  /// `dart:convert`
  ///
  /// Converts [GetItemsRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
