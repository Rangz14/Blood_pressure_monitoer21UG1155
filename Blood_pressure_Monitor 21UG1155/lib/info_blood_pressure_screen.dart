import 'package:flutter/material.dart';

class InfoBloodPressureScreen extends StatelessWidget {
  final int systolic;
  final int diastolic;

  
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  InfoBloodPressureScreen({
    required this.systolic,
    required this.diastolic,
  });

  String getCategory() {
    if (systolic < 120 && diastolic < 80) {
      return 'Normal';
    } else if (systolic >= 120 && systolic <= 129 && diastolic < 80) {
      return 'Elevated';
    } else if (systolic >= 130 && systolic <= 139 && diastolic >= 80 && diastolic <= 89) {
      return 'Hypertension Stage 1';
    } else if (systolic >= 140 && diastolic >= 90) {
      return 'Hypertension Stage 2';
    } else {
      return 'Hypertensive Crisis';
    }
  }

  @override
  Widget build(BuildContext context) {
    String category = getCategory();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Pressure Info'),
        backgroundColor: Colors.cyan[200],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/Image/bloodp.png', // Path to your image asset
                  width: 250, // Image width
                  height: 250, // Image height
                ),
                const SizedBox(height: 20), // Adding some spacing
                Text(
                  'Systolic: $systolic mm Hg',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  'Diastolic: $diastolic mm Hg',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    'Category: $category',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
