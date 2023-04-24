import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Function(Color) onColorSelected;

  ColorPicker({required this.onColorSelected});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = Colors.blue; // set initial color to blue
  }

  void _onColorSelected(Color color) {
    setState(() {
      _selectedColor = color;
    });
    widget.onColorSelected(color);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ColorButton(
          color: Colors.red,
          isSelected: _selectedColor == Colors.red,
          onTap: () => _onColorSelected(Colors.red),
        ),
        ColorButton(
          color: Colors.green,
          isSelected: _selectedColor == Colors.green,
          onTap: () => _onColorSelected(Colors.green),
        ),
        ColorButton(
          color: Colors.blue,
          isSelected: _selectedColor == Colors.blue,
          onTap: () => _onColorSelected(Colors.blue),
        ),
      ],
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function onTap;

  ColorButton({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 3,
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
