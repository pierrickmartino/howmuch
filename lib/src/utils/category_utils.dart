import 'dart:convert';

import 'package:http/http.dart';

import '../model/category.dart';
import '../../constant/const.dart';

class CategoryUtils {
  static final String _baseUrl = "https://parseapi.back4app.com/classes/";

  //Create
  static Future<Response> addCategory(Category category) async {
    String apiUrl = _baseUrl + "Category";

    Response response = await post(
      apiUrl,
      headers: {
        'X-Parse-Application-Id': kParseApplicationId,
        'X-Parse-REST-API-Key': kParseRestApiKey,
        'Content-Type': 'application/json'
      },
      body: json.encode(category.toJson()),
    );

    return response;
  }

  //Read
  static Future getCategoryList() async {
    String apiUrl = _baseUrl + "Category" + '?order=name';

    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }

  //Update
  static Future updateCategory(Category category) async {
    String apiUrl = _baseUrl + "Category/${category.objectId}";

    Response response = await put(apiUrl,
        headers: {
          'X-Parse-Application-Id': kParseApplicationId,
          'X-Parse-REST-API-Key': kParseRestApiKey,
          'Content-Type': 'application/json',
        },
        body: json.encode(category.toJson()));

    return response;
  }

  //Delete
  static Future deleteCategory(String objectId) async {
    String apiUrl = _baseUrl + "Category/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }
}
