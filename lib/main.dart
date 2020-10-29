import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/injection/injection.dart';
import 'bloc/blocs.dart';
import 'config/config.dart';
import 'pages/home_page.dart';
import 'routes/NavigatorUtil.dart';
import 'routes/route.dart';
import 'utility/framework/Application.dart';

// For blocs export:
// import 'bloc/product/product_bloc.dart';
// import 'package:flutter_cubit_bloc_tutorial/bloc/weather/weather_bloc.dart';

// For routing:
// import 'package:fluro/fluro.dart';

// For dependency injection:
// import 'data/repository/weather_repository.dart';
// import 'data/repository/product_repository.dart';
// import 'data/service/product_service.dart';

void main() {
  // setupLocator();
  // configureDependencies();
  initConfig();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('zh', 'HK')],
      path: 'assets/i18n', // <-- change patch to your
      fallbackLocale: Locale('zh', 'HK'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.locale = Locale('zh', 'HK');
    return MaterialApp(
        title: 'Material App',
        // home: HomePage(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        home: BlocProvider(
          create: (context) => getIt<ProductBloc>(),
          child: HomePage(),
        ),
        // initialRoute: AppRoutes.home,
        onGenerateRoute: Application.router.generator);
  }
}
