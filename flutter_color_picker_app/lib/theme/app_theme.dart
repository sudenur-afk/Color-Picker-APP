import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.pink,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
