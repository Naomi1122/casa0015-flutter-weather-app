import 'package:flutter/material.dart';
import 'package:weathet_app/ui/widgets/main_screen/header_widget.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen_model.dart';

import 'package:provider/provider.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final model = context.read<MainScreenModel>();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(249, 247, 188, 241),
//         title: const Text('Settings'),
//       ),
//       body: const Center(
//         child: Text('Settings'),
//       ),
//     );
//   }
// }

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(249, 247, 188, 241),
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
