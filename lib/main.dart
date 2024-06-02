import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_service_app/admin_dashboared/adminpage.dart';
import 'package:house_service_app/controller/data_controller.dart';
import 'package:house_service_app/pages/home/home.dart';
import 'package:house_service_app/pages/splash_page/splash.dart';

import 'controller/auth_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb!) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDcoilehPkmyVJOfQPJ0iSqBYtiNoH9LhI",
            authDomain: "steppennycoin.firebaseapp.com",
            projectId: "steppennycoin",
            storageBucket: "steppennycoin.appspot.com",
            messagingSenderId: "403687957048",
            appId: "1:403687957048:web:bf2138c0bc98c26c9f3ccd",
            measurementId: "G-EGCDHGZD7P"));
  }
  await Firebase.initializeApp();

  runApp(const MyApp());
  Get.put(Auth_Controller());
  Get.put(DataController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Neigbour Hub',
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
