import 'package:flutter_cubit_bloc_tutorial/data/model/product_model.dart';
import 'package:flutter_cubit_bloc_tutorial/data/service/product_service.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRepository {
  /// Throws [NetworkException].
  Stream<Product> fetchProduct(String id);
}

@LazySingleton(as: ProductRepository)
class APIProductRepository implements ProductRepository {
  ProductService _productService;
  // APIProductRepository(productService)
  //     : assert(productService != null),
  //       _productService = productService;
  APIProductRepository(this._productService);
  Product _product;

  @override
  Stream<Product> fetchProduct(String id) async* {
    // store data in local db
    // Store api response in repository.
    // First if _product has cache then return cache first and then get the api response for checking any updated product
    // If yes, return newProduct to the stream and close the stream.
    // If no, nothing. Close the stream.
    if (_product != null) yield _product;
    final newProduct = await _productService.fetchProduct("1");
    print(newProduct == _product);
    if (newProduct != _product) {
      print("new product is not equal to _product");
      _product = newProduct;
      yield _product;
    }
  }
}

class NetworkException implements Exception {}
