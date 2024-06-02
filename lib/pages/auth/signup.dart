// ignore_for_file: deprecated_member_use, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/controller/auth_controller.dart';
import 'package:house_service_app/controller/data_controller.dart';
import 'package:house_service_app/utils/colors.dart';

import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final Auth_Controller authController = Get.find();
  final DataController dataController = Get.find();

  Map<String, String> userSignupData = {
    "username": "",
    "email": "",
    "password": "",
  };

  signUp() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('User Sign Up Data $userSignupData');
      authController.signup(
        userSignupData['email'],
        userSignupData['password'],
        userSignupData['username'],
      );
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    // Check if username has already been used
    if (_usernameController.text == 'existing_username') {
      return 'This username is already taken';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'^[A-Z]').hasMatch(value)) {
      return 'Password must start with a capital letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'images/applogo.png',
                          height: 200,
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'SignUp your account',
                            style: GoogleFonts.poppins(
                                color: mainColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 30, left: 30, right: 30, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          validator: _usernameValidator,
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainColor, width: 2.0),
                            ),
                            label: const Text(' UserName'),
                            labelStyle: GoogleFonts.poppins(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            hintText: '@Aizal',
                            hintStyle: const TextStyle(color: Colors.black38),
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 35,
                              color: mainColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          validator: _emailValidator,
                          controller: _emailController,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            label: const Text(' Email'),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainColor, width: 2.0),
                            ),
                            labelStyle: GoogleFonts.poppins(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            hintText: '@gmail',
                            hintStyle: const TextStyle(color: Colors.black38),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: mainColor,
                              size: 35,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          validator: _passwordValidator,
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            label: const Text(' Password'),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainColor, width: 2.0),
                            ),
                            labelStyle: GoogleFonts.poppins(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            hintText: 'atleast 8 digits',
                            hintStyle: const TextStyle(color: Colors.black38),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: mainColor,
                              size: 35,
                            ),
                            suffixIcon: IconButton(
                              onPressed: _togglePasswordVisibility,
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: mainColor,
                                size: 30,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            userSignupData['email'] = _emailController.text;
                            userSignupData['password'] =
                                _passwordController.text;
                            userSignupData['username'] =
                                _usernameController.text;
                            signUp();
                          }
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(right: 30, left: 30, bottom: 20),
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'SignUp',
                              style: GoogleFonts.lora(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: GoogleFonts.lora(
                                fontSize: 16,
                                color: mainColor,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.lora(
                                  fontSize: 18,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
