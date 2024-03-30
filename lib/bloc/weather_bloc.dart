import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>((event, emit) {
      // TODO: implement event handler
    });
    void _getCurrentWeather(
        WeatherFetched event, Emitter<WeatherState> emit) async {
      try {
        final weather = await weatherRepository.getCurrentWeather();
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure(e.toString()));
      }
    }
  }
}
