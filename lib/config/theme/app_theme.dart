import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5c11d4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.pink,
  Colors.cyanAccent,
  Colors.green,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1 ,
            'Colors must be between o and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
