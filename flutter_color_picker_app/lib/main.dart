import 'package:flutter/material.dart';
import 'package:flutter_renk_secici_app/pages/color_picker_page.dart';
import 'package:flutter_renk_secici_app/theme/app_theme.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.theme, home: ColorPickerPage());
  }
}
