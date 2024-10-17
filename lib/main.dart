import 'package:codagetest/views/screens/home/home_screen.dart';
import 'package:codagetest/views/themes/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ServicePreviewPage(),
      theme: ThemesController().getLightTheme,
      darkTheme: ThemesController().getLightTheme,
    );
  }
}
