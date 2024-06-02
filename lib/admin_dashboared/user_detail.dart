import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/utils/colors.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp,
                color: mainColor, size: 30)),
        centerTitle: true,
        title: Text(
          'User Details',
          style: GoogleFonts.zenDots(fontSize: 24, color: mainColor),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('Neigbour_Users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final members = snapshot.data!.docs;
          return ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              final memberDocument = members[index];
              final subcollectionReference =
                  memberDocument.reference.collection('messages');
              return StreamBuilder<QuerySnapshot>(
                stream: subcollectionReference.snapshots(),
                builder: (context, subSnapshot) {
                  if (subSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: const CircularProgressIndicator());
                  }
                  if (subSnapshot.hasError) {
                    return Text('Error: ${subSnapshot.error}');
                  }
                  final subDocs = subSnapshot.data!.docs;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemberDetailsPage(subDocs)),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: mainColor),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: ListTile(
                        leading: Image.asset('images/applogo.png'),
                        title: Text(
                          memberDocument['UserName'],
                          style: GoogleFonts.lora(
                              color: mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          memberDocument['email'],
                          style: GoogleFonts.lora(color: mainColor),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class MemberDetailsPage extends StatelessWidget {
  final List<QueryDocumentSnapshot> subDocs;

  MemberDetailsPage(this.subDocs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp,
                color: mainColor, size: 30)),
        centerTitle: true,
        title: Text(
          'Messages Details',
          style: GoogleFonts.zenDots(fontSize: 24, color: mainColor),
        ),
      ),
      body: ListView.builder(
        itemCount: subDocs.length,
        itemBuilder: (context, index) {
          final subDoc = subDocs[index];
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: mainColor),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Image.asset(
                'images/applogo.png',
                height: 50,
              ),
              subtitle: Text(
                subDoc['timestamp'].toString(),
                style: GoogleFonts.poppins(color: mainColor),
              ),
              title: Text(
                subDoc['text'],
                style: GoogleFonts.poppins(color: mainColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
