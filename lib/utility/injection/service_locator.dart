import 'package:flutter_cubit_bloc_tutorial/bloc/product/product_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/weather/weather_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/repository/product_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/data/repository/weather_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/data/service/product_service.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/dio/dioHelper.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;
void setupLocator() {
  // Bloc need to be registerFactory
  locator.registerLazySingleton<ProductService>(
      () => ProductService(DioProvider()));
  locator.registerLazySingleton<APIProductRepository>(
      () => APIProductRepository(locator<ProductService>()));
  locator.registerFactory<ProductBloc>(
      () => ProductBloc(locator<APIProductRepository>()));
  locator.registerLazySingleton<FakeWeatherRepository>(
      () => FakeWeatherRepository());

  locator.registerFactory<WeatherBloc>(
      () => WeatherBloc(locator<FakeWeatherRepository>()));
}
