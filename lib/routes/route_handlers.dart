import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/blocs.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/home_page.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/injection/injection.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BlocProvider<ProductBloc>(
    create: (context) => getIt<ProductBloc>(),
    child: HomePage(),
  );
});

var weatherSearchPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // return WeatherSearchPage();
  return BlocProvider<WeatherBloc>(
    create: (context) => getIt<WeatherBloc>(),
    child: WeatherSearchPage(),
  );
});
