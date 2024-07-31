

import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/products_model.dart';

class ApiProvider {
  ProductModel? productModel;
  static const String baseUrl = "https://dummyjson.com";
  Future<ProductModel?> getProducts() async {
    try {
      Response response = await Dio().get("$baseUrl/products",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });

      productModel = ProductModel.fromJson(response.data);
      print(productModel?.products![0].title);

      return productModel;
    } catch (e) {
      print(e);
    }
  }




  Future userLogin({required String userName, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      FormData userData =
      FormData.fromMap({"username": userName, "password": password});
      Response response =
      await Dio().post("$baseUrl/auth/login", data: userData);
      await prefs.setString("userToken", response.data["token"]);
      String? userToken = prefs.getString("userToken");
      print("User Token => $userToken");
      return "Login Success";
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data["message"]);
        return e.response?.data["message"];
      }
    }
  }



}
