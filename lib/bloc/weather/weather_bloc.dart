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
