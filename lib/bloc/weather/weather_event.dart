part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

// GetWeather/PostWeather/DeleteWeather/UpdateWeather
class GetWeather extends WeatherEvent {
  final String cityName;

  // constructor
  GetWeather(this.cityName);
}

class UpdateWeather extends WeatherEvent {
  final String cityName;
  UpdateWeather(this.cityName);
}
