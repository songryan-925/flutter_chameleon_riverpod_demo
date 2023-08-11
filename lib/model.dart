import 'package:flutter/material.dart';

@immutable
class ThemeModel {
  final bool isDarkMode;
  final Color seedColor;

  const ThemeModel({
    required this.isDarkMode,
    required this.seedColor,
  });
}
