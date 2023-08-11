import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'model.dart';

part 'providers.g.dart';

@riverpod
class CountGenerator extends _$CountGenerator {
  var _currentIndex = 0;

  @override
  Stream<String> build({int initialValue = 0}) {
    _currentIndex = initialValue;
    return Stream.periodic(const Duration(seconds: 1), (_) {
      _currentIndex++;
      return 'Hello $_currentIndex';
    });
  }

  resetIndex() {
    _currentIndex = 0;
  }
}

@riverpod
class AppTheme extends _$AppTheme {
  @override
  ThemeModel build() {
    return ThemeModel(
      isDarkMode: true,
      seedColor: Colors.blue,
    );
  }

  setDarkMode(bool value) {
    if (state.isDarkMode == value) return;
    state = ThemeModel(isDarkMode: value, seedColor: state.seedColor);
  }

  setSeedColor(Color value) {
    if (state.seedColor == value) return;
    state = ThemeModel(isDarkMode: state.isDarkMode, seedColor: value);
  }
}
