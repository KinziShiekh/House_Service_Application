import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/admin_dashboared/dashbored.dart';
import 'package:house_service_app/utils/colors.dart';

class AdminVerificationScreen extends StatefulWidget {
  @override
  _AdminVerificationScreenState createState() =>
      _AdminVerificationScreenState();
}

class _AdminVerificationScreenState extends State<AdminVerificationScreen> {
  final String adminCode = '1234'; // Predefined admin code
  String enteredCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Admin Verification',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {
                    enteredCode = value;
                  });
                },
                keyboardType: TextInputType.number,
                maxLength: 4,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter 4-Digit Code',
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      color: mainColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor, // Background color
                  ),
                  onPressed: () {
                    _verifyAdmin();
                  },
                  child: Text(
                    'Verify',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyAdmin() {
    if (enteredCode == adminCode) {
      // Admin code is correct, perform desired action here
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashbordScreen()));
      // Navigate to the next screen or perform other actions
    } else {
      // Admin code is incorrect, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Verification Failed'),
            content: Text('Incorrect code. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
