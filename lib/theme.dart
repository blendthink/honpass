import 'package:flutter/material.dart';

const _lightPrimaryColor = Color(0xFF00AAFF);
const _lightPrimaryColorDark = Color(0xFF007ED1);
const _lightAccentColor = Color(0xFFFF9D39);

const _darkPrimaryColor = Color(0xFF0078FF);
const _darkPrimaryColorDark = Color(0xFF004CD1);
const _darkAccentColor = Color(0xFFFF6B39);

final lightAppTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPrimaryColor,
    primaryColorDark: _lightPrimaryColorDark,
    accentColor: _lightAccentColor
);

final darkAppTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPrimaryColor,
    primaryColorDark: _darkPrimaryColorDark,
    accentColor: _darkAccentColor
);