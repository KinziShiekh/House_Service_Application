import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/pages/chatScreen/chat.dart';
import 'package:house_service_app/pages/home/home.dart';
import 'package:house_service_app/pages/profile/profile2.dart';
import 'package:house_service_app/pages/profile/update.dart';
import 'package:house_service_app/pages/services/services.dart';
import 'package:house_service_app/utils/colors.dart';

import '../../controller/data_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DataController controller = Get.find();

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
      ),
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Neigbour_Users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          }
          if (!snapshot.hasData ||
              snapshot.data == null ||
              !snapshot.data!.exists) {
            return const Center(child: Text('No user data found'));
          }
          var userProfileData = snapshot.data!.data() as Map<String, dynamic>?;

          if (userProfileData == null) {
            return const Center(child: Text('User data is null'));
          }

          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'images/applogo.png',
                        height: 200,
                      ),
                    ),
                    Text(
                      'Neigbour_Hub',
                      style: GoogleFonts.zenDots(
                        color: mainColor,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTileContainer(
                title: 'UserName',
                sub: userProfileData['UserName'] ?? 'N/A',
                leadIcon: Icons.person,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => ProfileUpdate())));
                },
              ),
              ListTileContainer(
                title: 'Email',
                sub: userProfileData['email'] ?? 'N/A',
                leadIcon: Icons.email,
                onPressed: () {},
              ),
              Container(
                decoration: BoxDecoration(
                    color: mainColor,
                    border: Border.all(color: mainColor),
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(30),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProfileUpdate())));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 30,
                          color: mainColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Update_Profile',
                          style: GoogleFonts.lora(
                              fontSize: 22,
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ListTileContainer extends StatelessWidget {
  final String title;
  final String sub;
  final IconData leadIcon;
  final VoidCallback onPressed;

  const ListTileContainer({
    Key? key,
    required this.title,
    required this.sub,
    required this.leadIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          leadIcon,
          color: mainColor,
          size: 30,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          sub,
          style: GoogleFonts.lora(
            fontSize: 16,
            color: mainColor,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
