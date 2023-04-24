import 'package:flutter/material.dart';
import 'color_widget.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   Color _selectedColor = Colors.blue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(249, 247, 188, 241),
//         title: const Text('Settings'),
//       ),
//       body: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           ColorPicker(
//             selectedColor: _selectedColor,
//             onColorChanged: (color) {
//               setState(() {
//                 _selectedColor = color;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//           FlatButton(
//             onPressed: () {
//               // Do something with the selected color
//             },
//             child: const Text('Save'),
//             color: _selectedColor,
//             textColor: Colors.white,
//           ),
//         ]),
//       ),
//     );
//   }
// }

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(249, 247, 188, 241),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enable feature',
              style: TextStyle(fontSize: 18),
            ),
            Switch(
              value: _isEnabled,
              onChanged: (value) {
                setState(() {
                  _isEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
