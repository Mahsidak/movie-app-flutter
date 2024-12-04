import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_constant.dart';
import 'api_enum.dart';

class APIService {

  APIService();

  static APIService sharedInstance = APIService();

  Future<http.Response> genericNetworkRequest({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? params,
    bool showLoader = true,
  }) async {
    final url = Uri.parse('$path');
    http.Response response;

    try {
      // Handle request methods
      switch (method) {
        case RequestMethod.GET:
          response = await http.get(url, headers: APIConstant.headers);
          break;
        case RequestMethod.POST:
          response = await http.post(
            url,
            headers: APIConstant.headers,
            body: jsonEncode(params),
          );
          break;
        case RequestMethod.PUT:
          response = await http.put(
            url,
            headers: APIConstant.headers,
            body: jsonEncode(params),
          );
          break;
        case RequestMethod.DELETE:
          response = await http.delete(url, headers: APIConstant.headers);
          break;
        default:
          throw Exception('Unsupported HTTP method');
      }

      print('-------------------------------------------------------------');
      print('Request URL: $url');
      print('Request Method: ${method.name}');
      print('Request Params: $params');
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');
      print('-------------------------------------------------------------');

      return response;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

}