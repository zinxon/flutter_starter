import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/routes/route.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/framework/Application.dart';

class NavigatorUtil {
  static void goHomePage(BuildContext context) {
    /// Routes.home 路由地址
    /// replace：true 就是将 splash 頁面給移除掉了，這點後退鍵的時候就不會再出現Splash頁面
    Application.router.navigateTo(context, AppRoutes.home, replace: true);
  }

  static void goWeatherSearchPage(BuildContext context) {
    Application.router
        .navigateTo(context, AppRoutes.weatherSearchPage, replace: true);
  }
}
