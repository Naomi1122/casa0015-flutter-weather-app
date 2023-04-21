import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';

class BarometerWidget extends StatelessWidget {
  const BarometerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    final snapshot = model.forecastObject;
    var temperature = snapshot!.current?.tempC;
    var speed = snapshot.current?.windKph;
    var humidity = snapshot.current?.humidity;
    var pressure = snapshot.current?.pressureMb;
    var visKm = snapshot.current?.visKm;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 10),
          //   // child: appText(
          //   //   size: 20,
          //   //   color: primaryColor.withOpacity(.8),
          //   //   text: 'Barometer',
          //   //   isBold: FontWeight.bold,
          //   // ),
          // ),
          Card(
            color: Colors.amber[50],
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customListTile(
                    first: 'Temperature:',
                    second: ' $temperature °C',
                    icon: Icons.thermostat,
                    iconColor: Colors.orange,
                  ),
                  customListTile(
                    first: 'Humidity:',
                    second: ' $humidity %',
                    icon: Icons.water_drop_outlined,
                    iconColor: Colors.blueGrey,
                  ),
                  customListTile(
                    first: 'Pressure:',
                    second: ' $pressure hPa',
                    icon: Icons.speed,
                    iconColor: Colors.red[300]!,
                  ),
                  customListTile(
                    first: 'Visibility:',
                    second: ' $visKm Km',
                    icon: Icons.lens_blur,
                    iconColor: Colors.red[300]!,
                  ),
                  customListTile(
                    text: snapshot.current!.windDir!,
                    first: 'Wind Speed:',
                    second: ' $speed km/h',
                    icon: Icons.air,
                    iconColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
