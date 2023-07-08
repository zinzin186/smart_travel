

import 'dart:convert';

import '../../model/base/list_api_response.dart';
import '../../model/home_block.dart';
import '../api.dart';
import '../constants.dart';

class HomeService {
  final ApiService _service = ApiService(Constants.contentDomain);

  Future<ListAPIResponse<HomeBlockModel>> getHomeBlocks(
      {String nextLink = '', int limit = 10}) async {
    final params = {
      "lang_code": "vi",
    };

    final response =
    await _service.getData(endPoint: "/V3/home", query: params);
    return ListAPIResponse.fromJson(_parseJson(response));
  }

  Map<String, dynamic> _parseJson(var response) {
    Map<String, dynamic> json = {};
    if (response.data is String) {
      json = jsonDecode(response.data);
    } else if (response.data is Map) {
      json = response.data;
    }
    return json;
  }

}