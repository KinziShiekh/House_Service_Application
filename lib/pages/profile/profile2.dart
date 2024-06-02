import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/chatScreen/chat.dart';
import 'package:house_service_app/pages/profile/profile.dart';
import 'package:house_service_app/pages/services/services.dart';
import 'package:house_service_app/pages/splash_page/splash.dart';
import 'package:house_service_app/utils/colors.dart';

import '../home/home.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 3;

    void _onItemTapped(int index) {
      setState(() {
        switch (index) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            break;
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ServicePage()));
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

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('images/applogo.png'),
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/applogo.png'),
            ListTile(
              title: Text(
                'Profile',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: mainColor,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: mainColor,
                  )),
            ),
            ListTile(
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: mainColor,
                  )),
              title: Text(
                'FAQ',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: mainColor,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQScreen()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: mainColor,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                );
              },
            ),
          ],
        ),
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

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: mainColor,
            )),
        centerTitle: true,
        title: Text(
          'FAQ',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          FAQCard(
            question: 'How do I book a service?',
            answer:
                'Booking a service is easy. Simply browse through the list of available services, select the one you need, specify your requirements, and choose a convenient time slot. Once confirmed, a service provider will be assigned to your task.',
          ),
          FAQCard(
            question: 'What if I am not satisfied with the service?',
            answer:
                'If you are not satisfied with the service provided, you can contact our customer support team and we will do our best to resolve the issue promptly. We also offer a satisfaction guarantee for all our services.',
          ),
          // Add more FAQ cards as needed
        ],
      ),
    );
  }
}

class FAQCard extends StatelessWidget {
  final String question;
  final String answer;

  const FAQCard({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: GoogleFonts.poppins(
              color: mainColor, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              answer,
              style: GoogleFonts.poppins(
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
