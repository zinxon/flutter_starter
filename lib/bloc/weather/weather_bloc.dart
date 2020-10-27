import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/weather.dart';
import '../../data/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  /* Cannot use assertion because it cause injectable failed to generate
  //
  // WeatherBloc(weatherRepository)
  //     : assert(weatherRepository != null),
  //       _weatherRepository = weatherRepository,
  //       super(WeatherInitial());
  [WARNING] injectable_generator:injectable_config_builder on lib/utility/injection/injection.dart:
Missing dependencies in flutter_cubit_bloc_tutorial/utility/injection/injection.dart

[WeatherBloc] depends on unregistered type [dynamic] 

Did you forget to annotate the above classe(s) or their implementation with @injectable?
  */
  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetWeather) {
      try {
        yield WeatherLoading();
        // usecase
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkException {
        yield WeatherError("Couldn't fetch weather.");
      }
    } else if (event is UpdateWeather) {
      try {
        yield WeatherLoading();
        // usecase
        final weather = await _weatherRepository.updateWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkException {
        yield WeatherError("Couldn't fetch weather.");
      }
    }
  }
}
