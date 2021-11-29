import 'dart:convert';

import 'package:book_app/data/user_model_list.dart';
import 'package:http/http.dart';

class APIClinet {
  final Client _client;

  APIClinet(this._client);

  Future<dynamic> get(String url) async {
    final response = await _client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final UserModelList userModelList = UserModelList.fromJson(responseBody);
      return userModelList;
    } else {
      return Exception("API failed");
    }
  }
}
