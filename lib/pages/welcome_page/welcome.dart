import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/auth/login_page.dart';
import 'package:house_service_app/utils/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('images/Neig (2).png'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Hello👋',
              style: GoogleFonts.poppins(
                  fontSize: 22, color: mainColor, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 40),
            child: Text(
              'Welcome to Neighbor Hub, the ultimate app designed to cater to all your home service needs. Whether you need repairs, maintenance, or cleaning services,',
              style: GoogleFonts.poppins(fontSize: 18, color: mainColor),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(30),
                width: 300,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
