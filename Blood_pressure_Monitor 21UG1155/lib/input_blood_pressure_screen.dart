import 'package:flutter/material.dart';
import 'info_blood_pressure_screen.dart';


// ignore: use_key_in_widget_constructors
class InputBloodPressureScreen extends StatefulWidget {
  @override
 
  // ignore: library_private_types_in_public_api
  _InputBloodPressureScreenState createState() => _InputBloodPressureScreenState();
}

class _InputBloodPressureScreenState extends State<InputBloodPressureScreen> {
  late TextEditingController systolicController;
  late TextEditingController diastolicController;

  @override
  void initState() {
    super.initState();
    systolicController = TextEditingController();
    diastolicController = TextEditingController();
  }

  @override
  void dispose() {
    systolicController.dispose();
    diastolicController.dispose();
    super.dispose();
  }

  void validateAndNavigate() {
    int? systolic = int.tryParse(systolicController.text);
    int? diastolic = int.tryParse(diastolicController.text);

    if (systolic != null &&
        diastolic != null &&
        systolic > 0 &&
        diastolic > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoBloodPressureScreen(
            systolic: systolic,
            diastolic: diastolic,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Data'),
            
            // ignore: prefer_const_constructors
            content: Text('Please enter valid systolic and diastolic values.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                
                // ignore: prefer_const_constructors
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        // ignore: prefer_const_constructors
        title: Text(
          'Blood Pressure Monitor',
          
          // ignore: prefer_const_constructors
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.cyan[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                   
                    // ignore: prefer_const_constructors
                    Text(
                      'Systolic(mm Hg): ',
                      
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextField(
                        controller: systolicController,
                        
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Systolic (mm Hg)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    
                    // ignore: prefer_const_constructors
                    Text(
                      'Diastolic(mm Hg): ',
                     
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextField(
                        controller: diastolicController,
                        
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Diastolic (mm Hg)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: validateAndNavigate,
              
              // ignore: prefer_const_constructors
              child: Text('Show Info'),
            ),
          ],
        ),
      ),
    );
  }
}
