import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  Map<String, dynamic> toMap() {
    return {"themeMode": themeMode.index};
  }

  static ThemeState fromMap(Map<String, dynamic> map) {
    return ThemeState(themeMode: ThemeMode.values[map["themeMode"]]);
  }
}
