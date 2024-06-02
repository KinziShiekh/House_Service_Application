import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/admin_dashboared/adminpage.dart';
import 'package:house_service_app/pages/home/home.dart';
import 'package:house_service_app/utils/colors.dart';

class ChooseAdmin_User extends StatefulWidget {
  const ChooseAdmin_User({super.key});

  @override
  State<ChooseAdmin_User> createState() => _ChooseAdmin_UserState();
}

class _ChooseAdmin_UserState extends State<ChooseAdmin_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/applogo.png'),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminVerificationScreen()));
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'As a admin',
                  style: GoogleFonts.zenDots(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'As a user',
                  style: GoogleFonts.zenDots(
                      color: Colors.white,
                      fontSize: 20,
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
