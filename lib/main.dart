// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_with_api2/ui/screens/homescreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
