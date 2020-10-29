import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/product_model.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/dio/dioHelper.dart';
// import 'package:flutter_cubit_bloc_tutorial/utility/dio/dioHelper.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/log/DioLogger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductService {
  static const String TAG = 'ProductService';
  DioProvider _dioProvider;
  ProductService(this._dioProvider);
  // Dio _dio = DioProvider.dio;

  Future<Product> fetchProduct(String id) async {
    // Simulate network delay
    Response response = await _dioProvider.dio.get("/products/$id");
    // Response response =
    //     await Dio().get("https://fakestoreapi.com/products/$id");
    var product = Product.fromJson(jsonDecode(response.toString()));
    // Log.info("AmplifyAuthCognito is initialized!");
    return product;
  }
}
