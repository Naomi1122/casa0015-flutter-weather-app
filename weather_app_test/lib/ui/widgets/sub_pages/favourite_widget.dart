import 'package:flutter/material.dart';
import 'package:weathet_app/ui/widgets/main_screen/cityinfo_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/header_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(249, 247, 188, 241),
        title: const Text('Favorite'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Center(child: WeatherIndexWidget()),
          Center(child: Text('Widget 2')),
          Center(child: Text('Widget 3')),
          Center(child: Text('Widget 4')),
        ],
      ),
    );
  }
}

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
        'https://devapi.qweather.com/v7/indices/1d?type=1,2&location=101010100&key=3750971dc4f04622ad1ee2f8757e16ae'));
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
    return isLoading ? CircularProgressIndicator() : Text(data.toString());
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My App'),
//         ),
//         body: Center(
//           child: WeatherIndexWidget(),
//         ),
//       ),
//     );
//   }
// }
