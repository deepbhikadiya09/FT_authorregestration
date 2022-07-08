import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Book"),
      ),
      body: GetBuilder<AddBookController>(
        init: addBookController,
        builder: (controller) => Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                      }else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
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
                    SizedBox(height: 10,),
                    InputField(
                      maxLine: 1,
                      controller: addBookController.ratingController,
                      focusNode: addBookController.ratingFocusNode,
                      hint: "Rating",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Rating";
                        } else {
                          return null;
                        }
                      },
                    ),
                  remindMeDateSelectWidget(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  InkWell remindMeDateSelectWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();

        _selectDate(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: context.width / 50,
          ),
          Icon(Icons.calendar_today_rounded,
              color: Colors.brown, size: 50),
          SizedBox(
            width: 10,
          ),
          Text(
              "Scheduled for:  ${addBookController.selectedDate.month.toString().padLeft(2, '0')}-${addBookController.selectedDate.day.toString().padLeft(2, '0')}-${addBookController.selectedDate.year}",
              style: TextStyle(fontSize: 17))
          // Text(
          //     UtilsVariable.scheduled, style: UtilsVariable.taskStyle)
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    print(addBookController.selectedDate
        .compareTo(DateTime.now())
        .isNegative);
    final DateTime? selected = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme:
            ColorScheme.light(primary: Colors.brown),
          ),
          child: child ?? Text(""),
        );
      },
      context: context,
      initialDate: (addBookController.selectedDate
          .compareTo(DateTime.now())
          .isNegative)
          ? DateTime.now()
          : addBookController.selectedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != addBookController.selectedDate) {
      addBookController.selectedDate = selected;
      addBookController.update();
    }
  }
}
