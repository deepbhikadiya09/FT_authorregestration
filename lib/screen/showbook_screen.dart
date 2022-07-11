import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../app_route.dart';
import '../controller/addbook_controller.dart';
import '../controller/showbook_controller.dart';
import '../theme/app_text_theme.dart';

class ShowBookScreen extends StatefulWidget {
  const ShowBookScreen({Key? key}) : super(key: key);

  @override
  State<ShowBookScreen> createState() => _ShowBookScreenState();
}

class _ShowBookScreenState extends State<ShowBookScreen> {
  final showBookController = Get.put<ShowBookController>(ShowBookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "Author's Book",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            onPressed: () {
              Get.toNamed(Routes.addBookScreen);
            },
            icon: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ],
      ),
      body: GetBuilder<ShowBookController>(
        init: showBookController,
        builder: (controller) => ListView.builder(
            reverse: false,
            itemCount: showBookController.finalData.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(20),
                elevation: 5,
                child: Container(
                  height: 200,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.file(
                        File(showBookController.finalData[index]['image']),
                        height: 180,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${showBookController.finalData[index]['bookName']}",
                              style: primaryColor24TextStyleMedium,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "About Book : ${showBookController.finalData[index]['aboutBook']}",
                              style: primaryColor18TextStyleMedium,
                            ),
                            Text(
                              "Author : ${showBookController.finalData[index]['authorName']}",
                              style: primaryColor18TextStyleMedium,
                            ),
                            Text(
                              "Rating : ${showBookController.finalData[index]['rating']} / 5",
                              style: primaryColor18TextStyleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
