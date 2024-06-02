import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/chatScreen/chat.dart';
import 'package:house_service_app/pages/profile/profile.dart';
import 'package:house_service_app/pages/profile/profile2.dart';
import 'package:house_service_app/pages/services/carpenter/carpenter.dart';
import 'package:house_service_app/pages/services/chef/chef.dart';
import 'package:house_service_app/pages/services/electric/electric.dart';
import 'package:house_service_app/pages/services/plumber/plumber.dart';
import 'package:house_service_app/pages/services/services.dart';
import 'package:house_service_app/pages/services/sweaper.dart';
import 'package:house_service_app/pages/services/tutor/tutor.dart';
import 'package:house_service_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _makePhoneCall() async {
    const phoneNumber =
        'tel:+923227709677'; // Prefix with 'tel:' and replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _PhoneCall() async {
    const phoneNumber =
        'tel:+92 320 7094244'; // Prefix with 'tel:' and replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  int _selectedIndex = 0;
  final List images = [
    'images/ic (5).png',
    'images/ic (4).png',
    'images/ic (3).png',
    'images/ic (2).png',
    'images/ic (1).png',
    'images/ic (6).png',
  ];
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

  final List text = [
    'Carpenter',
    'Online Tutor',
    'Plumber',
    'Electrition',
    'Sweapers',
    'Cheif'
  ];
  final List title = [
    'Muhammad Ali',
    'Shahid',
    'Azeem',
    'Shameer',
  ];
  final List speciality = [
    'Carpenter',
    'Electrition',
    'Chef',
    'Painter',
  ];
  final List screens = [
    CarpenterPage(),
    TutorPage(),
    PlumberPage(),
    ElectricPage(),
    SweaperPage(),
    ChefPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Neigbour Hub',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset('images/applogo.png'),
        actions: [
          IconButton(
              onPressed: () {
                _makePhoneCall();
              },
              icon: const Icon(
                Icons.call,
                size: 30,
                color: mainColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(height: 200, child: CarouselDemo()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    'Catogories',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(20),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServicePage()));
                      },
                      child: Text(
                        'All',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screens[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.all(8.0),
                      width: 160.0,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            images[index],
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            text[index],
                            style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.only(bottom: 10, right: 20, left: 20),
                  child: Text(
                    'Contact List',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: title.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainColor),
                    width: 300, // Adjust width as needed
                    child: ListTile(
                      title: Text(
                        title[index],
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        speciality[index],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _PhoneCall();
                        },
                        icon: const Icon(Icons.call),
                        color: Colors.white,
                      ),
                      leading: const Icon(
                        Icons.home_repair_service,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
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

class CarouselDemo extends StatelessWidget {
  final List<String> imgList = [
    'images/b (1).jpeg',
    'images/b.jpeg',
    'images/b (3).jpeg',
    'images/b (4).jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imgList
          .map((item) => Container(
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              ))
          .toList(),
    );
  }
}
