import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/detailPage/SweeperDetail.dart';
import 'package:house_service_app/utils/colors.dart';

class SweaperPage extends StatefulWidget {
  const SweaperPage({super.key});

  @override
  State<SweaperPage> createState() => _SweaperPageState();
}

class _SweaperPageState extends State<SweaperPage> {
  final List images = [
    'images/s (4).png',
    'images/s (5).png',
    'images/s (6).png',
    'images/s (7).png'
  ];
  final List text = [
    'Shama Adil',
    'Muhammad Ali',
    'Kainat Ali',
    'Salman Shakir'
  ];

  final List screens = [
    const PersonDetailPage(
        name: 'Shama Adil',
        email: 'shamas@gmail.com',
        information:
            'This is a high-performance sweeper designed to make cleaning efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.',
        Speciality: 'Sweeper'),
    const PersonDetailPage(
        name: 'Muhammad Ali',
        email: 'Ali@gmail.com',
        information:
            'This is a high-performance sweeper designed to make cleaning efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.',
        Speciality: 'Sweeper'),
    const PersonDetailPage(
        name: 'Kainat Ali',
        email: 'Kainat@gmail.com',
        information:
            'This is a high-performance sweeper designed to make cleaning efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.',
        Speciality: 'Sweeper'),
    const PersonDetailPage(
        name: 'Salman Shakir',
        email: 'Salman@gmail.com',
        information:
            'This is a high-performance sweeper designed to make cleaning efficient and effortless. With advanced features and a robust build, it is perfect for both residential and commercial use.',
        Speciality: 'Sweeper')
  ];

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
            'Sweapers',
            style: GoogleFonts.zenDots(
                fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(20),
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
                      icon: const Icon(
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
