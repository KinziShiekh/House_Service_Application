// ignore_for_file: avoid_print, camel_case_types, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:house_service_app/controller/common.dart';
import 'package:house_service_app/pages/auth/login_page.dart';
import 'package:house_service_app/pages/choose.dart';

import '../pages/home/home.dart';

class Auth_Controller extends GetxController {
  var userId;
  Future<void> signup(
    email,
    password,
    username,
  ) async {
    try {
      // Sign up user with Firebase
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      userId = userCredential.user!.uid;
      print('User signed up successfully: ${userCredential.user!.uid}');

      // Add user data to Firestore collection
      try {
        var response = await FirebaseFirestore.instance
            .collection('Neigbour_Users')
            .doc(userCredential.user!.uid)
            .set({
          'user_Id': userCredential.user!.uid,
          'UserName': username,
          'email': email,
        });
        // Print Firestore response
      } catch (e) {
        // Handle Firestore data addition error
        print('Failed to add user data to Firestore: $e');
      }
      Get.to(LoginPage());
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      if (e.code == 'weak-password') {
        // Show error dialog for weak password
        CommanDialog.showErrorDialog(
            description: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        // Show error dialog for existing email
        CommanDialog.showErrorDialog(
            description: 'The account already exists for that email.');
      } else {
        // Show generic error dialog for other exceptions
        CommanDialog.showErrorDialog(
            description: 'Failed to sign up: ${e.message}');
      }
    } catch (e) {
      // Hide loading indicator if an unexpected error occurs

      // Show error dialog for unexpected errors
      CommanDialog.showErrorDialog(
          description: 'Failed to sign up: ${e.toString()}');
    }
  }

  Future<void> login(email, password) async {
    print('$email,$password'); // Print email and password for debugging
    try {
      // Sign in user with Firebase
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);

      print('User logged in successfully: ${credential.user!.uid}');
      userId = credential.user!.uid;
      Get.to((const ChooseAdmin_User()));
      // You can navigate to another screen or perform any action here
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      if (e.code == 'user-not-found') {
        // Show error dialog for user not found
        CommanDialog.showErrorDialog(
            description: 'No user found for that email');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // Show error dialog for wrong password
        CommanDialog.showErrorDialog(
            description: 'Wrong password provided for that user');
        print('Wrong password provided for that user.');
      } else {
        // Show generic error dialog for other exceptions
        CommanDialog.showErrorDialog(
            description: 'Failed to sign in: ${e.message}');
        print('Failed to sign in: ${e.message}');
      }
    } catch (e) {
      // Show generic error dialog for unexpected errors
      CommanDialog.showErrorDialog(
          description: 'Failed to sign in: ${e.toString()}');
      print('Failed to sign in: ${e.toString()}');
    }
  }
}
