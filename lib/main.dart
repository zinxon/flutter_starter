import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/weather/weather_bloc.dart';
// import 'package:flutter_cubit_bloc_tutorial/config/Env.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/locator/injection.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/log/Log.dart';

import 'bloc/product/product_bloc.dart';
// import 'data/repository/weather_repository.dart';
// import 'data/repository/product_repository.dart';
// import 'data/service/product_service.dart';
import 'pages/home_page.dart';
import 'utility/locator/service_locator.dart';

void main() {
  // setupLocator();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  // WeatherBloc(FakeWeatherRepository()),
                  getIt<WeatherBloc>(),
            ),
            BlocProvider(
              create: (context) =>
                  // ProductBloc(APIProductRepository(ProductService())),
                  getIt<ProductBloc>(),
            ),
          ],
          child: HomePage(),
        ));
  }
}
