import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:weathet_app/models/weather_model.dart';
import 'package:weathet_app/utils/constants.dart';
import 'package:weathet_app/utils/location.dart';

class WeatherApi {
  final _client = HttpClient();

  static const _host =
      Constants.WEATHER_BASE_SCHEME + Constants.WEATHER_BASE_URL_DOMAIN;

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<WeatherForecastModel> fetchWeatherForecast({String? cityName}) async {
    Map<String, String> parameters;

    final url = _makeUri(Constants.WEATHER_FORECAST_PATH, {
      'key': Constants.WEATHER_APP_ID,
      'q': cityName,
      'days': '1',
    });

    log('request: ${url.toString()}');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((val) => jsonDecode(val)) as Map<String, dynamic>;
    return WeatherForecastModel.fromJson(json);
  }
}
