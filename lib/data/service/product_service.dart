import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/product_model.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/log/DioLogger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductService {
  static const String TAG = 'ProductService';
  Future<Product> fetchProduct(String id) async {
    // Simulate network delay
    Response response =
        await Dio().get("https://fakestoreapi.com/products/$id");
    var product = Product.fromJson(jsonDecode(response.toString()));
    // Log.info("AmplifyAuthCognito is initialized!");
    DioLogger.onSuccess(TAG, response);
    return product;
  }
}
