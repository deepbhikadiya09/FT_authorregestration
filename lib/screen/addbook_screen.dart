import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../common/input_field.dart';
import '../controller/addbook_controller.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  var formKey = GlobalKey<FormState>();
  final addBookController = Get.put<AddBookController>(AddBookController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          toolbarHeight: 70,
          title: Text(
            "Add Book",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: GetBuilder<AddBookController>(
          init: addBookController,
          builder: (controller) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    (addBookController.pickImage != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(addBookController.pickImage!,
                                height: 200, width: 200, fit: BoxFit.cover),
                          )
                        : Icon(
                            Icons.account_circle,
                            size: 200,
                          ),
                    Center(
                      child: CupertinoButton(
                        onPressed: () {
                          addBookController.showMyCupertinoDialoge(context);
                        },
                        child: Text("Add a Book"),
                      ),
                    ),
                    InputField(
                      maxLine: 1,
                      controller: addBookController.bookNameController,
                      focusNode: addBookController.bookNameFocusNode,
                      hint: "Book Name",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Book Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputField(
                      maxLine: 1,
                      controller: addBookController.authorNameController,
                      focusNode: addBookController.authorNameFocusNode,
                      hint: "Author Name",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Author Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputField(
                      maxLine: 5,
                      controller: addBookController.aboutAuthorController,
                      focusNode: addBookController.aboutAuthorFocusNode,
                      hint: "About Author",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter About Author";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputField(
                      maxLine: 5,
                      controller: addBookController.aboutBookController,
                      focusNode: addBookController.aboutBookFocusNode,
                      hint: "About Book",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter About Book";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // InputField(
                    //   maxLine: 1,
                    //   controller: addBookController.ratingController,
                    //   focusNode: addBookController.ratingFocusNode,
                    //   hint: "Rating",
                    //   textInputAction: TextInputAction.next,
                    //   keyboardType: TextInputType.text,
                    //   validator: (val) {
                    //     if (val!.isEmpty) {
                    //       return "Please Enter Rating";
                    //     }else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    SmoothStarRating(
                        allowHalfRating: false,
                        onRatingChanged: (v) {
                          addBookController.rating = v;
                          addBookController.update();
                          print(addBookController.rating);
                        },
                        starCount: 5,
                        rating: addBookController.rating,
                        size: 40.0,
                        color: Colors.brown,
                        borderColor: Colors.brown,
                        spacing: 0.0),
                    SizedBox(
                      height: 10,
                    ),
                    addBookController.remindMeDateSelectWidget(context),
                    SizedBox(
                      height: 30,
                    ),
                    addBookController.buildButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
