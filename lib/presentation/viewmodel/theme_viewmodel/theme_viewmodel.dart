import 'package:flutter/material.dart';
import 'theme_bloc.dart';
import 'theme_event.dart';

class ThemeViewModel {
  final ThemeBloc themeBloc;

  ThemeViewModel(this.themeBloc);

  // Get current theme
  ThemeMode get currentTheme => themeBloc.state.themeMode;

  // Toggle theme
  void toggleTheme() {
    themeBloc.add(ToggleThemeEvent());
  }

  // Set theme directly
  void setTheme(ThemeMode mode) {
    themeBloc.add(SetThemeEvent(mode));
  }
}
