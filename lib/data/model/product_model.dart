import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    String title, //productName
    double price,
    String description,
    String image,
  }) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
