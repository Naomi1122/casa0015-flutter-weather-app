import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';
import 'package:weathet_app/utils/ui.dart';
import 'package:weathet_app/ui/widgets/main_screen/header_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/cityinfo_widget.dart';
import 'package:weathet_app/ui/widgets/sub_pages/setting_widget.dart';
import 'package:weathet_app/ui/widgets/sub_pages/favourite_widget.dart';
import '7forecast_widget.dart';
import 'AQI_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritePage()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 211, 211),
      appBar: AppBar(
        title: Text('My Weather App'),
        backgroundColor: Color.fromARGB(249, 247, 188, 241),
      ),
      body:
          model.forecastObject?.location?.name != null && model.loading == false
              ? _ViewWidget()
              : const Center(
                  child: SpinKitCubeGrid(color: Colors.blue, size: 80),
                ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _ViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();

    return SafeArea(
      child: Stack(
        children: [
          model.forecastObject!.location!.name != 'Null'
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(height: 70),
                        CityInfoWidget(),
                        SizedBox(height: 15),
                        CarouselWidget(),
                        SizedBox(height: 15),
                        AQIWidget(),
                        SizedBox(height: 15),
                        ForecastWidget()
                      ]),
                )
              : Center(
                  child: appText(size: 16, text: '123'),
                ),
          const HeaderWidget(),
        ],
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    final snapshot = model.forecastObject;
    var time = DateTime.now().hour;

    return SizedBox(
      height: 100,
      child: Card(
        color: bgGreyColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 23,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: index == time ? const EdgeInsets.only(left: 20) : null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    index < 11
                        ? appText(
                            size: 14,
                            text: '${index + 1} am',
                            color: primaryColor)
                        : index == 11
                            ? appText(
                                size: 14,
                                text: '${index + 1} pm',
                                color: primaryColor)
                            : appText(
                                size: 14,
                                text: '${index - 11} pm',
                                color: primaryColor),
                    const SizedBox(height: 10),
                    Image.network(
                        'https://${(snapshot!.forecast!.forecastday![0].hour![index].condition!.icon).toString().substring(2)}',
                        scale: 2),
                    const SizedBox(height: 5),
                    appText(
                      size: 14,
                      text:
                          '${snapshot.forecast!.forecastday![0].hour![index].tempC}°',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreenWidget();
  }
}
