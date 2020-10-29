// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../dio/dioHelper.dart';
import '../../bloc/product/product_bloc.dart';
import '../../data/repository/product_repository.dart';
import '../../data/service/product_service.dart';
import '../../bloc/weather/weather_bloc.dart';
import '../../data/repository/weather_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<DioProvider>(() => DioProvider());
  gh.lazySingleton<ProductService>(() => ProductService(get<DioProvider>()));
  gh.lazySingleton<WeatherRepository>(() => FakeWeatherRepository());
  gh.lazySingleton<ProductRepository>(
      () => APIProductRepository(get<ProductService>()));
  gh.factory<WeatherBloc>(() => WeatherBloc(get<WeatherRepository>()));
  gh.factory<ProductBloc>(() => ProductBloc(get<ProductRepository>()));
  return get;
}
