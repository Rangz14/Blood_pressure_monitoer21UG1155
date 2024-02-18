import 'package:flutter/material.dart';
import 'input_blood_pressure_screen.dart';

class HeartBPMApp extends StatelessWidget {
  const HeartBPMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Pressure Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[200],
      ),
      home: InputBloodPressureScreen(),
    );
  }
}
