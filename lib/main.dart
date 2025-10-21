import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_with_api2/homescreen.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(),
      home: Homescreen(),
    );
  }
}
