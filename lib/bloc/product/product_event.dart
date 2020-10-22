part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProduct extends ProductEvent {
  final String id;

  // constructor
  GetProduct(this.id);
}
