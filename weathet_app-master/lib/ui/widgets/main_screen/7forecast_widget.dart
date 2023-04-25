//import 'package:dartx/dartx.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';

// class ForecastWidget extends StatelessWidget {
//   const ForecastWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final model = context.read<MainScreenModel>();
//     final snapshot = model.forecastObject;
//     //var day = DateTime.now().day;

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: appText(
//               size: 20,
//               color: primaryColor.withOpacity(.8),
//               text: '7 days forecast',
//               isBold: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: 100,
//             child: Card(
//               color: bgGreyColor,
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(11)),
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: 7,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (BuildContext context, index) {
//                   final conditionIcon = snapshot!
//                       .forecast!.forecastday![index].day!.condition!.icon;
//                   final tempC =
//                       snapshot.forecast!.forecastday![index].day!.avgtempC;
//                   print('index: $index');
//                   String label;
//                   label = '${index + 1}';

//                   // if (index < 7) {
//                   //   label = '${index + 1}';
//                   // } else {
//                   //   label = '${index + 1}';
//                   // }

//                   return Container(
//                     margin: index == 1 ? const EdgeInsets.only(left: 20) : null,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Column(
//                         children: [
//                           appText(
//                             size: 14,
//                             text: label,
//                             color: primaryColor,
//                           ),
//                           const SizedBox(height: 10),
//                           Image.network(
//                             'https://${conditionIcon?.substring(2)}',
//                             scale: 2,
//                           ),
//                           const SizedBox(height: 5),
//                           appText(
//                             size: 14,
//                             text: '${tempC}°',
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
class ForecastWidget extends StatelessWidget {
  const ForecastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    final snapshot = model.forecastObject;
    final forecastdayList = snapshot!.forecast?.forecastday;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: appText(
              size: 20,
              color: primaryColor.withOpacity(.8),
              text: '7 days forecast',
              isBold: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100,
            child: Card(
              color: bgGreyColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  final conditionIcon =
                      forecastdayList![index].day?.condition?.icon;
                  final tempC = forecastdayList[index].day?.avgtempC;
                  String label = '${index + 1}';

                  return Container(
                    margin: index == 0 ? const EdgeInsets.only(left: 20) : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          appText(
                            size: 14,
                            text: label,
                            color: primaryColor,
                          ),
                          const SizedBox(height: 10),
                          Image.network(
                            'https://${conditionIcon?.substring(2)}',
                            scale: 2,
                          ),
                          const SizedBox(height: 5),
                          appText(
                            size: 14,
                            text: '${tempC}°',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
