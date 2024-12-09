import 'package:flutter/material.dart';

// Define a custom light theme color scheme
ColorScheme lightColorScheme = const ColorScheme(
  primary: Color(0xFF6200EE),
  secondary: Color(0xFF03DAC6),
  surface: Color(0xFFFFFFFF),
  error: Color(0xFFB00020),
  onPrimary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFF000000),
  onSurface: Color(0xFF000000),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.light,
  
);

// Define a custom dark theme color scheme
ColorScheme darkColorScheme = const ColorScheme(
  primary: Color(0xFFBB86FC),
  secondary: Color(0xFF03DAC6),
  surface: Color(0xFF121212),
  error: Color(0xFFCF6679),
  onPrimary: Color(0xFF000000),
  onSecondary: Color(0xFF000000),
  onSurface: Color(0xFFFFFFFF),
  onError: Color(0xFF000000),
  brightness: Brightness.dark,
);
