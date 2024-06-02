import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/admin_dashboared/user_detail.dart';
import 'package:house_service_app/pages/chatScreen/recieve.dart';
import 'package:house_service_app/pages/profile/profile.dart';
import 'package:house_service_app/utils/colors.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('images/applogo.png'),
        centerTitle: true,
        title: Text(
          'Dashbored',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/g (2).png'),
          Container(height: 200, child: GridViewExample()),
        ],
      ),
    );
  }
}

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // 2 columns
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: <Widget>[
        CustomColumn(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MembersScreen()));
          },
          icon: Icons.details,
          text: 'User Details',
        ),
        CustomColumn(
          icon: Icons.chat,
          text: 'Chat',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatRecieve()));
          },
        ),
        CustomColumn(
          icon: Icons.person,
          text: 'Profile',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),

        // Add more CustomColumn widgets for additional items
      ],
    );
  }
}

class CustomColumn extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomColumn({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: mainColor, // You can change the color here
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 36,
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
