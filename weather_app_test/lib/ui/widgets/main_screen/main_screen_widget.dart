import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 212, 212),
      body:
          model.forecastObject?.location?.name != null && model.loading == false
              ? _ViewWidget()
              : const Center(
                  child: SpinKitCubeGrid(color: Colors.blue, size: 80),
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
                      ]),
                )
              : Center(
                  child: appText(size: 16, text: 'test'),
                ),
        ],
      ),
    );
  }
}

class CityInfoWidget extends StatelessWidget {
  const CityInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    final snapshot = model.forecastObject;
    var city = snapshot!.location?.name;
    var temp = snapshot.current?.tempC!.round();
    var feelTemp = snapshot.current?.feelslikeC;
    var windDegree = snapshot.current?.windDegree;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 30,
              text: '$city',
              isBold: FontWeight.bold,
              color: Color(0xff2c2c2c),
            ),
            RotationTransition(
              turns: AlwaysStoppedAnimation(windDegree! / 360),
              child: const Icon(Icons.north, color: Color(0xff2c2c2c)),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 70,
              text: '$temp°',
            ),
            appText(size: 20, text: '$feelTemp°', color: Color(0xff9a9a9a)),
          ],
        ),
      ],
    );
  }
}
