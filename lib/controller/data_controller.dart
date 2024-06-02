// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:house_service_app/controller/auth_controller.dart';

class DataController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'UserName': '', 'email': '', 'gender': ''};
  Auth_Controller auth_controller = Auth_Controller();

  void onReady() {
    super.onReady(); // Not sure what this line does, commenting it out
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    try {
      var response = await firebaseInstance
          .collection('Steppeny_Users')
          .where('user_Id',
              isEqualTo: auth_controller
                  .userId) // authController.userId is used here, ensure it's declared
          .get();
      if (response.docs.isNotEmpty) {
        userProfileData['UserName'] = response.docs[0]['UserName'];
        userProfileData['email'] = response.docs[0]['email'];
        userProfileData['gender'] = response.docs[0]['gender'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}
