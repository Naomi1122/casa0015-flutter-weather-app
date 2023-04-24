// import 'dart:math';
// import 'package:weathet_app/utils/ui.dart';
// import 'package:flutter/material.dart';

// class AqiChartPainter extends CustomPainter {
//   final double ratio;
//   final String value;
//   final String desc;

//   AqiChartPainter(
//       {required this.ratio, required this.value, required this.desc});

//   @override
//   void paint(Canvas canvas, Size size) {
//     var radius = size.height / 2 - 10;
//     var centerX = size.width / 2;
//     var centerY = size.height / 2;
//     var centerOffset = Offset(centerX, centerY);
//     // 绘制半透明圆弧
//     Path path = Path();
//     path.addArc(Rect.fromCircle(center: centerOffset, radius: radius), pi * 0.7,
//         pi * 1.6);
//     Paint paint = Paint();
//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 4;
//     paint.strokeCap = StrokeCap.round;
//     paint.color = Color.fromARGB(97, 78, 152, 189);
//     canvas.drawPath(path, paint);
//     // 绘制纯白色圆弧
//     path.reset();
//     path.addArc(Rect.fromCircle(center: centerOffset, radius: radius), pi * 0.7,
//         pi * 1.6 * ratio);
//     paint.color = Color.fromARGB(255, 238, 32, 32);
//     canvas.drawPath(path, paint);
//     // 绘制 AQIValue
//     var valuePara = UiUtils.getParagraph(value, 30);
//     canvas.drawParagraph(
//         valuePara,
//         Offset(centerOffset.dx - valuePara.width / 2,
//             centerOffset.dy - valuePara.height / 2));
//     // 绘制 AQIDesc
//     var descPara = UiUtils.getParagraph("$desc", 15);
//     canvas.drawParagraph(
//         descPara,
//         Offset(centerOffset.dx - valuePara.width / 2,
//             centerOffset.dy + valuePara.height / 2));
//   }

//   @override
//   bool shouldRepaint(AqiChartPainter oldDelegate) {
//     return oldDelegate.ratio != ratio ||
//         oldDelegate.value != value ||
//         oldDelegate.desc != desc;
//   }
// }

// class AqiChart extends StatelessWidget {
//   final double ratio;
//   final String value;
//   final String desc;

//   AqiChart({required this.ratio, required this.value, required this.desc});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: AqiChartPainter(
//         ratio: ratio,
//         value: value,
//         desc: desc,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:weathet_app/utils/constants.dart';

class AQIWidget extends StatelessWidget {
  const AQIWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    final snapshot = model.forecastObject;
    var co = snapshot!.current!.air_quality?.co;
    var no2 = snapshot.current!.air_quality?.no2;
    var o3 = snapshot.current!.air_quality?.o3;
    var pm2_5 = snapshot.current!.air_quality?.pm2_5;
    var pm10 = snapshot.current!.air_quality?.pm10;
    var gb_defra_index = snapshot.current!.air_quality?.gb_defra_index;

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
              text: 'AQI',
              isBold: FontWeight.bold,
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExpansionTile(
                      title: customListTile(
                        first: 'UK Defra Index: ',
                        second: ' $gb_defra_index ',
                        icon: Icons.wb_sunny,
                        iconColor: Colors.orange,
                      ),
                      initiallyExpanded: false,
                      children: [
                        customListTile(
                          first: 'CO: ',
                          second: ' $co ',
                          icon: Icons.wb_sunny,
                          iconColor: Colors.orange,
                        ),
                        customListTile(
                          first: 'NO2:',
                          second: ' $no2 ',
                          icon: Icons.water_drop_outlined,
                          iconColor: Colors.blueGrey,
                        ),
                        customListTile(
                          first: 'O3:',
                          second: ' $o3',
                          icon: Icons.speed,
                          iconColor: Colors.red[300]!,
                        ),
                        customListTile(
                          first: 'PM 2.5:',
                          second: ' $pm2_5',
                          icon: Icons.lens_blur,
                          iconColor: Colors.red[300]!,
                        ),
                        customListTile(
                          first: 'PM 10:',
                          second: ' $pm10',
                          icon: Icons.air,
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
