import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/chatScreen/chat.dart';
import 'package:house_service_app/pages/home/home.dart';
import 'package:house_service_app/pages/profile/profile.dart';
import 'package:house_service_app/pages/profile/profile2.dart';
import 'package:house_service_app/pages/services/carpenter/carpenter.dart';
import 'package:house_service_app/pages/services/chef/chef.dart';
import 'package:house_service_app/pages/services/doctor/doctor.dart';
import 'package:house_service_app/pages/services/electric/electric.dart';
import 'package:house_service_app/pages/services/painter/painter.dart';
import 'package:house_service_app/pages/services/plumber/plumber.dart';
import 'package:house_service_app/pages/services/sweaper.dart';
import 'package:house_service_app/pages/services/tutor/tutor.dart';
import 'package:house_service_app/utils/colors.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ServicePage()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
          break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          break;
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        centerTitle: true,
        title: Text(
          'HomeServices',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns
        children: <Widget>[
          ContainerService('images/ic (1).png', 'Sweepers', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SweaperPage()));
          }),

          ContainerService('images/ic (2).png', 'Electritions', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ElectricPage()));
          }),
          ContainerService('images/ic (3).png', 'Pulumber', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PlumberPage()));
          }),

          ContainerService('images/ic (4).png', 'Online Tutor', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TutorPage()));
          }),
          ContainerService('images/ic (5).png', 'Carpenter', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CarpenterPage()));
          }),

          ContainerService('images/ic (6).png', 'Chef', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChefPage()));
          }),

          ContainerService('images/ic (7).png', 'Painter', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PainterPage()));
          }),
          ContainerService('images/ic (8).png', 'Doctor', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DoctorPage()));
          }),
          // Add more containers as needed
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // Change to your mainColor
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: mainColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_rounded, color: mainColor),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: mainColor),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: mainColor),
            label: 'Profile',
          ),
        ],
        selectedItemColor: mainColor,

        selectedLabelStyle: TextStyle(color: mainColor),
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
    );
  }
}

Widget ContainerService(String image, String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: mainColor, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8.0),
      width: 160.0,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
