import 'package:flutter/material.dart';
import 'package:weathet_app/ui/widgets/main_screen/cityinfo_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/header_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';
import 'package:weathet_app/utils/ui.dart';
import 'package:weathet_app/ui/widgets/main_screen/header_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/cityinfo_widget.dart';
import 'package:weathet_app/ui/widgets/sub_pages/setting_widget.dart';
import 'package:weathet_app/ui/widgets/sub_pages/life_indicies_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(249, 247, 188, 241),
        title: const Text('Life Indicies'),
      ),
      body: Center(
        child: WeatherIndexWidget(),
      ),
    );
  }
}
// GridView.count(
//   crossAxisCount: 2,
//   children: [
//     Center(child: WeatherIndexWidget()),
//     Center(child: Text('Widget 2')),
//     Center(child: Text('Widget 3')),
//     Center(child: Text('Widget 4')),
//   ],
// ),

class WeatherIndexWidget extends StatefulWidget {
  @override
  _WeatherIndexWidgetState createState() => _WeatherIndexWidgetState();
}

class _WeatherIndexWidgetState extends State<WeatherIndexWidget> {
  Map<String, dynamic> data = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://devapi.qweather.com/v7/indices/1d?type=1,2,4&location=BA333&key=3750971dc4f04622ad1ee2f8757e16ae&lang=en'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sports_soccer, size: 40),
                    SizedBox(height: 10),
                    Text(
                      'Sport',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Level: ${data['daily'][0]['level']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Category: ${data['daily'][0]['category']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_car_wash, size: 40),
                    SizedBox(height: 10),
                    Text(
                      'Car Wash',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Level: ${data['daily'][1]['level']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Category: ${data['daily'][1]['category']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phishing, size: 40),
                    SizedBox(height: 10),
                    Text(
                      'Fishing',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Level: ${data['daily'][2]['level']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Category: ${data['daily'][2]['category']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
