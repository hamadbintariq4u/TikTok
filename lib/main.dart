// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/controller/auth_controller.dart';
import 'package:tiktok/view/screens/auth/signup_screen.dart';

import 'view/widgets/glich.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TikTok Lite',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: EasySplashScreen(
        logo: Image.network(
            'https://seeklogo.com/images/T/tiktok-logo-1F4A5DCD45-seeklogo.com.png'),
        title: Text(
          "TikTok Lite",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundColor,
        showLoader: true,
        loaderColor: Colors.white,
        loadingText: Text("Loading..."),
        durationInSeconds: 5,
        navigator: SignUpScreen(),
      ),
    );
  }
}
