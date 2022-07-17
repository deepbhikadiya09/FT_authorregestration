import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app_route.dart';
import 'package:untitled/screen/addbook_screen.dart';
import 'package:untitled/screen/on_boarding_screen.dart';
import 'package:untitled/screen/showbook_screen.dart';
import 'package:untitled/screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      debugShowCheckedModeBanner: false,
      title: 'authorRegestration',
      initialRoute: Routes.initial,
      getPages: Routes.pages,
      // home: OnBoardingScreen(),
    );
  }
}

