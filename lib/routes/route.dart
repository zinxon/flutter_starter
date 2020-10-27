import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/routes/route_handlers.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/framework/Application.dart';

void initRoute() {
  FluroRouter router = FluroRouter();
  AppRoutes.configureRoutes(router);
  Application.router = router;
}

class AppRoutes {
  static const String root = "/";
  static const String home = "/home";
  static const String weatherSearchPage = '/weather/search';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(home, handler: homeHandler);
    router.define(weatherSearchPage, handler: weatherSearchPageHandler);
  }
}
