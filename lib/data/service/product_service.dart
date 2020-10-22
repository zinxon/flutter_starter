import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/product.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductService {
  Future<Product> fetchProduct(String id) async {
    // Simulate network delay
    Response response =
        await Dio().get("https://fakestoreapi.com/products/$id");
    var product = Product.fromJson(jsonDecode(response.toString()));
    return product;
  }
}
