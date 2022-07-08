import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/screen/addbook_screen.dart';

void main() {
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
      home: AddBookScreen(),
    );
  }
}

