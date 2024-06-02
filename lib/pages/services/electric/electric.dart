import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/detailPage/SweeperDetail.dart';
import 'package:house_service_app/utils/colors.dart';

class ElectricPage extends StatefulWidget {
  const ElectricPage({super.key});

  @override
  State<ElectricPage> createState() => _ElectricPageState();
}

class _ElectricPageState extends State<ElectricPage> {
  final List images = [
    'images/e (1).png',
    'images/e (2).png',
    'images/e (3).png',
    'images/e (4).png',
  ];
  final List text = [' Adil Khan', 'Muhammad Ali', 'Saira Ali', 'Sahir Khan'];
  final List screens = [
    const PersonDetailPage(
        name: ' Adil Khan',
        email: 'shamas@gmail.com',
        information:
            "This is a high-performance electrician's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Electrition'),
    const PersonDetailPage(
        name: 'Muhammad Ali',
        email: 'Ali@gmail.com',
        information:
            "This is a high-performance electrician's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Electrition'),
    const PersonDetailPage(
        name: 'Saira  Ali',
        email: 'Kainat@gmail.com',
        information:
            "This is a high-performance electrician's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Electrition'),
    const PersonDetailPage(
        name: 'Sahir Shakir',
        email: 'Salman@gmail.com',
        information:
            "This is a high-performance electrician's tool designed to make electrical work efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.",
        Speciality: 'Electrition')
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
            'Electrtion',
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
                    'Electrition',
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
