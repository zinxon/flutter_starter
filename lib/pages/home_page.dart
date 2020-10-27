import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/product/product_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/mock/products.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/product_page.dart';
// import 'package:flutter_cubit_bloc_tutorial/utility/locator/service_locator.dart';

class HomePage extends StatelessWidget {
  // @override
  // void initState() {
  //   super.initState();
  //   getProduct(context);
  // }

  @override
  Widget build(BuildContext context) {
    context.bloc<ProductBloc>().add(GetProduct("1"));
    return Container(
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ProductError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Error"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductInitial) {
            return ProductPage(product: products[0]);
          } else if (state is ProductLoaded) {
            return ProductPage(product: state.product);
          }
          return ProductPage(product: products[0]);
        },
      ),
    );
  }

  // getProduct(
  //   BuildContext context,
  // ) async {
  //   final productBloc = context.bloc<ProductBloc>();
  //   // final productBloc = BlocProvider.of<ProductBloc>(context);
  //   // final productBloc = locator<ProductBloc>();
  //   productBloc.add(GetProduct("1"));
  // }
}
