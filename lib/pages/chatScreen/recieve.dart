import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/utils/colors.dart';

class ChatRecieve extends StatefulWidget {
  @override
  _ChatRecieveState createState() => _ChatRecieveState();
}

class _ChatRecieveState extends State<ChatRecieve> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
          'Chat',
          style: GoogleFonts.zenDots(
              fontSize: 20, color: mainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('Neigbour_Users')
                  .doc(_auth.currentUser!.uid)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final message = documents[index];
                    return ListTile(
                      title: Text(
                        message['text'],
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        message['email'],
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                      // You can add more information or formatting here
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Send a message...',
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: mainColor,
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: _firestore
                .collection('Neigbour_Users')
                .doc(_auth.currentUser!.uid)
                .collection('admin')
                .orderBy('timestamp')
                .snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final chatDocs = chatSnapshot.data!.docs;
              return ListView.builder(
                itemCount: chatDocs.length,
                itemBuilder: (ctx, index) => MessageBubble(
                  chatDocs[index]['text'],
                  chatDocs[index]['userId'] == _auth.currentUser?.uid,
                ),
              );
            },
          )),
        ],
      ),
    );
  }

  void _sendMessage() async {
    try {
      if (_controller.text.isNotEmpty) {
        final user = _auth.currentUser;
        if (user != null) {
          final userDocRef =
              _firestore.collection('Neigbour_Users').doc(user.uid);
          await userDocRef.collection('admin').add({
            'text': _controller.text,
            'userId': user.uid,
            'email': user.email,
            'timestamp': Timestamp.now(),
          });
          _controller.clear();
        } else {
          print('User not authenticated');
        }
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  MessageBubble(this.message, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: GoogleFonts.poppins(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
