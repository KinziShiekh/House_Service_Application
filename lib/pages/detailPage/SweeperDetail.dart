import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/chatScreen/chat.dart';
import 'package:house_service_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonDetailPage extends StatelessWidget {
  void _makePhoneCall() async {
    const phoneNumber =
        'tel:+92 320 7094244'; // Prefix with 'tel:' and replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  final String name;
  final String email;

  final String information;
  final String Speciality;
  const PersonDetailPage(
      {super.key,
      required this.name,
      required this.email,
      required this.information,
      required this.Speciality});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: mainColor,
            )),
        centerTitle: true,
        title: Text(
          'Person Detail',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundColor: mainColor,
                  radius: 50,
                  backgroundImage: AssetImage(
                    'images/s (4).png',
                  ),
                ),
              ),
              Center(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                ),
              ),
              Center(
                child: Text(
                  Speciality,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Bio',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        information,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Contact Information',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            email,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: const Icon(
                              Icons.email,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            '+92 320 7094244',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: IconButton(
                                onPressed: () {
                                  _makePhoneCall();
                                },
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 200,
                          child: Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen()));
                              },
                              child: const Text('Start Chat'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
