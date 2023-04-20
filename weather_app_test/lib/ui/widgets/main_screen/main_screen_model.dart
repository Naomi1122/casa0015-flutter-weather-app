import 'package:flutter/cupertino.dart';
import 'package:weathet_app/api/weather_api.dart';
import 'package:weathet_app/models/weather_model.dart';

class MainScreenModel extends ChangeNotifier {
  WeatherForecastModel? _forecastObject;
  WeatherForecastModel? get forecastObject => _forecastObject;

  bool _loading = true;
  bool get loading => _loading;
  String cityName = '';

  MainScreenModel() {
    setup();
  }

  Future<void> setup() async {
    _forecastObject ??=
        await WeatherApi().fetchWeatherForecast(cityName: 'London');
    //updateState();
  }
}
