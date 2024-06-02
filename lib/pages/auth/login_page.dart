// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_service_app/controller/auth_controller.dart';
import 'package:house_service_app/pages/auth/signup.dart';
import 'package:house_service_app/utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> userLoginData = {"email": "", "password": ""};
  Auth_Controller controller = Get.put(Auth_Controller());

  login() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('Data for login $userLoginData');
      controller.login(userLoginData['email'], userLoginData['password']);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool _isEmailValid(String email) {
    // Simple email validation using a regular expression
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isPasswordStrong(String password) {
    // Simple password strength check
    return password.length >= 8; // Adjust according to your requirements
  }

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Email validation
    if (!_isEmailValid(email)) {
      _showSnackbar('Invalid email address');
      return;
    }

    // Password strength check
    if (!_isPasswordStrong(password)) {
      _showSnackbar('Password is not strong enough');
      return;
    }

    _showSnackbar('Login successful');
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
                      Image.asset(
                        'images/applogo.png',
                        height: 200,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Login your account',
                            style: GoogleFonts.poppins(
                                color: mainColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 30, left: 30, right: 30, bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainColor, width: 2.0),
                            ),
                            label: const Text('Enter Your Email'),
                            labelStyle: GoogleFonts.poppins(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            hintText: '@gmail.com',
                            hintStyle: const TextStyle(color: Colors.black38),
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 35,
                              color: mainColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email Required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userLoginData['email'] = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 30, left: 30, right: 30, bottom: 20),
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainColor, width: 2.0),
                            ),
                            hintText: 'Atleast  8 digits  ',
                            labelStyle: GoogleFonts.poppins(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            label: Text('Enter Your Password'),
                            hintStyle: const TextStyle(
                              color: Colors.black38,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 35,
                              color: mainColor,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password Required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userLoginData['password'] = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          login();
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
                              'Login',
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
                            'Don\'t have an account? ',
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
                                      builder: (context) =>
                                          const SignupPage()));
                            },
                            child: Text(
                              "Sign Up",
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
