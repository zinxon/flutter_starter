import 'package:flutter_cubit_bloc_tutorial/data/service/product_service.dart';
import 'package:injectable/injectable.dart';

import '../model/product.dart';

abstract class ProductRepository {
  /// Throws [NetworkException].
  Future<Product> fetchProduct(String id);
}

@LazySingleton(as: ProductRepository)
class APIProductRepository implements ProductRepository {
  ProductService _productService;
  APIProductRepository(this._productService);
  @override
  Future<Product> fetchProduct(String id) async {
    var product = await _productService.fetchProduct("1");
    return product;
  }
}

class NetworkException implements Exception {}
