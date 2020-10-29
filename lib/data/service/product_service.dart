import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/product_model.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/dio/dioHelper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductService {
  static const String TAG = 'ProductService';
  DioProvider _dioProvider;
  ProductService(this._dioProvider);

  Future<Product> fetchProduct(String id) async {
    Response response = await _dioProvider.dio.get("/products/$id");
    // Response response =
    //     await Dio().get("https://fakestoreapi.com/products/$id");
    var product = Product.fromJson(jsonDecode(response.toString()));
    return product;
  }
}
