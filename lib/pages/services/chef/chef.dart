import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/detailPage/SweeperDetail.dart';
import 'package:house_service_app/utils/colors.dart';

class ChefPage extends StatefulWidget {
  const ChefPage({super.key});

  @override
  State<ChefPage> createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  final List images = [
    'images/chef (1).png',
    'images/chef (2).png',
    'images/chef (3).png',
    'images/chef (4).png',
  ];
  final List text = [' Adil Khan', 'Muhammad Ali', 'Saira Ali', 'Sahir Khan'];
  final List screens = [
    const PersonDetailPage(
        name: ' Adil Khan',
        email: 'shamas@gmail.com',
        information:
            "This is a high-performance Chef's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Chef'),
    const PersonDetailPage(
        name: 'Saira Ali',
        email: 'Ali@gmail.com',
        information:
            "This is a high-performance Chef's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Chef'),
    const PersonDetailPage(
        name: 'Bilal  Ali',
        email: 'Kainat@gmail.com',
        information:
            "This is a high-performance Chef's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Chef'),
    const PersonDetailPage(
        name: 'Sahir Khan',
        email: 'Salman@gmail.com',
        information:
            "This is a high-performance Chef's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Chef')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_sharp)),
          centerTitle: true,
          title: Text(
            'Chef',
            style: GoogleFonts.zenDots(
                fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => screens[index]));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      )),
                  leading:
                      Image.asset(images[index]), // Replace with your image URL
                  subtitle: Text(
                    'Sweepers',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  title: Text(
                    text[index],
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            childCount: 4, // Specify the number of items in the list
          ),
        ));
  }
}
