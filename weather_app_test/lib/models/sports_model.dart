import 'dart:ffi';

class SportsModel {
  List<Football>? football;
  List<Criket>? criket;
  List<Golf>? golf;

  SportsModel({this.football, this.criket, this.golf});

  SportsModel.fromJson(Map<String, dynamic> json) {
    if (json['football'] != null) {
      football = <Football>[];
      json['football'].forEach((v) {
        football!.add(Football.fromJson(v));
      });
    }
    if (json['criket'] != null) {
      criket = <Criket>[];
      json['criket'].forEach((v) {
        criket!.add(Criket.fromJson(v));
      });
    }
    if (json['golf'] != null) {
      golf = <Golf>[];
      json['golf'].forEach((v) {
        golf!.add(Golf.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (football != null) {
      data['football'] = football!.map((v) => v.toJson()).toList();
    }
    if (criket != null) {
      data['criket'] = criket!.map((v) => v.toJson()).toList();
    }
    if (golf != null) {
      data['golf'] = golf!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Football {
  String? stadium;
  num? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Football({
    this.stadium,
    this.country,
    this.region,
    this.tournament,
    this.start,
    this.match,
  });

  Football.fromJson(Map<String, dynamic> json) {
    stadium = json['stadium'];
    country = json['country'];
    region = json['region'];
    tournament = json['tournament'];
    start = json['start'];
    match = json['match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stadium'] = stadium;
    data['country'] = country;
    data['region'] = region;
    data['tournment'] = tournament;
    data['start'] = start;
    data['match'] = match;
    return data;
  }
}

class Criket {
  String? stadium;
  num? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Criket({
    this.stadium,
    this.country,
    this.region,
    this.tournament,
    this.start,
    this.match,
  });

  Criket.fromJson(Map<String, dynamic> json) {
    stadium = json['stadium'];
    country = json['country'];
    region = json['region'];
    tournament = json['tournament'];
    start = json['start'];
    match = json['match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stadium'] = stadium;
    data['country'] = country;
    data['region'] = region;
    data['tournment'] = tournament;
    data['start'] = start;
    data['match'] = match;
    return data;
  }
}

class Golf {
  String? stadium;
  num? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Golf({
    this.stadium,
    this.country,
    this.region,
    this.tournament,
    this.start,
    this.match,
  });

  Golf.fromJson(Map<String, dynamic> json) {
    stadium = json['stadium'];
    country = json['country'];
    region = json['region'];
    tournament = json['tournament'];
    start = json['start'];
    match = json['match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stadium'] = stadium;
    data['country'] = country;
    data['region'] = region;
    data['tournment'] = tournament;
    data['start'] = start;
    data['match'] = match;
    return data;
  }
}
