import 'package:flutter/cupertino.dart';
import 'package:weathet_app/api/sports_api.dart';
import 'package:weathet_app/models/sports_model.dart';

class SportsPageModel extends ChangeNotifier {
  SportsModel? _forecastObject;
  SportsModel? get forecastObject => _forecastObject;

  bool _loading = true;
  bool get loading => _loading;
  String cityName = '';

  SportsPageModel() {
    setup();
  }

  Future<void> setup() async {
    _forecastObject ??= await SportsApi().fetchSports(cityName: 'London');
    updateState();
  }

  // void onSubmitLocate() async {
  //   updateState();
  //   _forecastObject = await SportsApi().fetchSports();
  //   cityName = _forecastObject!.location!.name!;
  //   updateState();
  // }

  // void onSubmitSearch() async {
  //   if (cityName.isEmpty) return;
  //   updateState();
  //   _forecastObject =
  //       await WeatherApi().fetchWeatherForecast(cityName: cityName);
  //   cityName = '';
  //   updateState();
  // }

  void updateState() {
    _loading = !_loading;

    notifyListeners();
  }
}
