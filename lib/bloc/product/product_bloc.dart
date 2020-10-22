import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/product.dart';
import 'package:flutter_cubit_bloc_tutorial/data/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetProduct) {
      try {
        yield ProductLoading();
        // usecase
        final product = await _productRepository.fetchProduct(event.id);
        yield ProductLoaded(product);
      } on NetworkException {}
    }
  }
}
