class WeatherForecastModel {
  Location? location;
  Current? current;

  WeatherForecastModel({this.location, this.current});

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  double? lat;
  double? lon;
  num? localtimeEpoch;
  String? localtime;

  Location(
      {this.name, this.lat, this.lon, this.localtimeEpoch, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lat'] = lat;
    data['lon'] = lon;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  num? tempC;
  num? windDegree;
  String? windDir;
  double? feelslikeC;

  Current({
    this.tempC,
    this.windDegree,
    this.windDir,
  });

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp_c'] = tempC;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  num? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}
