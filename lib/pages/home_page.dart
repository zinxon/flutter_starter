import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/product/product_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/product.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/product_page.dart';
// import 'package:flutter_cubit_bloc_tutorial/utility/locator/service_locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [
    Product(
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "iPad mini"),
    Product(
        image: "assets/product2.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "iPad Pro"),
    Product(
        image: "assets/product3.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "iPhone Pro Max"),
    Product(
        image: "assets/product4.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "Apple Watch Series 3"),
    Product(
        image: "assets/product5.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "Apple Watch Series 4"),
    Product(
        image: "assets/product6.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "Macbook Pro 16 inch"),
    Product(
        image: "assets/product7.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "Macbook Pro"),
    Product(
        image: "assets/product8.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "iMac 4k Retina"),
    Product(
        image: "assets/product9.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "T-Shirts"),
    Product(
        image: "assets/product10.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "Ethnic Wear - Dress"),
    Product(
        image: "assets/product11.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "Dress"),
    Product(
        image: "assets/product12.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: 100,
        title: "T-Shirt"),
  ];

  @override
  void initState() {
    super.initState();
    getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //   centerTitle: true,
    //   title: Text(
    //     "Zirkol",
    //     style: TextStyle(color: Colors.black),
    //   ),
    //   backgroundColor: Colors.white,
    //   brightness: Brightness.light,
    // ));

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

  getProduct(
    BuildContext context,
  ) async {
    final productBloc = context.bloc<ProductBloc>();
    // final productBloc = locator<ProductBloc>();
    productBloc.add(GetProduct("1"));
  }
}
