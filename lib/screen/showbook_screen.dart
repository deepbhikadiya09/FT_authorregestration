import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/common/common_function.dart';
import 'package:untitled/screen/book_detail.dart';
import '../app_route.dart';
import '../common/image_utils.dart';
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
  void initState() {
    // TODO: implement initState
    showBookController.getdata();
    super.initState();
  }
  // Future<bool> _onBackPressed() async {
  //   return await showDialog(
  //       context: context, builder: (context) => exitDialogue());
  // }
  // exitDialogue() {
  //   return showCupertinoModalPopup(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) {
  //         return CupertinoAlertDialog(
  //           title: Text("Are you sure to Exit?"),
  //           actions: [
  //             CupertinoDialogAction(
  //               child: Text("No"),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             CupertinoDialogAction(
  //               textStyle: TextStyle(color: Colors.red),
  //               child: Text("Yes"),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Are you sure want to leave?'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      willLeave = true;
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yes')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('No'))
              ],
            ));
        return willLeave;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.addBookScreen);
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: const Text(
            "Author's Book",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: GetBuilder<ShowBookController>(
          init: showBookController,
          builder: (controller) => (showBookController.finalData.isEmpty)
              ? Center(
                  child: Text(
                    "No Data",
                    style: primaryColor18TextStyleMedium,
                  ),
                )
              : ListView.builder(
                  // reverse: true,
                  itemCount: showBookController.finalData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ShowBookDetailsScreen(
                            aboutBook: showBookController.finalData[index]
                                ['aboutBook'].toString(),
                            aboutAuthor: showBookController.finalData[index]
                                ['aboutAuthor'].toString(),
                            authorName: showBookController.finalData[index]
                                ['authorName'].toString(),
                            bookName: showBookController.finalData[index]
                                ['bookName'].toString(),
                            img: showBookController.finalData[index]['image'],
                            issueDate: showBookController.finalData[index]
                                ['date'].toString(),
                            rating: showBookController.finalData[index]['rating'].toString(),
                          );
                        }));
                      },
                      child: Card(
                        color: Colors.brown.shade100,
                        margin: EdgeInsets.all(20),
                        elevation: 5,
                        child: Container(
                          height: 200,
                          // color: Colors.red,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              isNullEmptyOrFalse(showBookController
                                      .finalData[index]['image'])
                                  ? Container()
                                  : getImageView(
                                      //this function call for network image with loader...
                                      finalUrl: showBookController
                                          .finalData[index]['image']
                                          .toString(),
                                      fit: BoxFit.cover,
                                      height: 180,
                                      width: 120),
                              const SizedBox(
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Issue Date : ${showBookController.finalData[index]['date']}",
                                      style: primaryColor14TextStyleMedium,
                                    ),
                                    Text(
                                      "Author : ${showBookController.finalData[index]['authorName']}",
                                      style: primaryColor14TextStyleMedium,
                                    ),
                                    Text(
                                      "Rating : ${showBookController.finalData[index]['rating']} / 5",
                                      style: primaryColor14TextStyleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
