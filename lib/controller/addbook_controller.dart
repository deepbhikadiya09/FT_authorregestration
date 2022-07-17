import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:untitled/app_route.dart';

import '../common/common_function.dart';


class AddBookController extends GetxController {
  final bookNameController = TextEditingController();
  FocusNode bookNameFocusNode = FocusNode();
  final authorNameController = TextEditingController();
  FocusNode authorNameFocusNode = FocusNode();
  final aboutAuthorController = TextEditingController();
  FocusNode aboutAuthorFocusNode = FocusNode();
  final aboutBookController = TextEditingController();
  FocusNode aboutBookFocusNode = FocusNode();

  DateTime selectedDate = DateTime.now();
  File? pickImage;
  UploadTask? uploadTask;
  FirebaseDatabase database = FirebaseDatabase.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  double rating=1.0;


  setData()async{

    CustomDialogs.getInstance.showProgressDialog();

    String fileName = basename(pickImage!.path);
      await FirebaseStorage.instance
          .ref(fileName)
          .putFile(File(pickImage!.path))
          .then((taskSnapshot) {
        print("task done");


        if (taskSnapshot.state == TaskState.success) {
          FirebaseStorage.instance
              .ref(fileName)
              .getDownloadURL()
              .then((url) {
            print("Here is the URL of Image $url");
            database.ref().child('database').push().set({
              "image": url,
              "bookName" : bookNameController.text,
              "authorName" : authorNameController.text,
              "aboutAuthor" : aboutAuthorController.text,
              "aboutBook": aboutBookController.text,
              "rating": rating,
              "date":"${selectedDate.day.toString()}/${selectedDate.month.toString()} /${selectedDate.year.toString()}",
            });

              CustomDialogs.getInstance.hideProgressDialog();

              Get.offNamed(Routes.showBookScreen);

          }).catchError((onError) {
            print("Got Error $onError");
          });
        }
      });


  }

  buildButton() {
    final isFormValid = bookNameController.text.isNotEmpty &&
        authorNameController.text.isNotEmpty &&
        aboutAuthorController.text.isNotEmpty &&
        aboutAuthorController.text.isNotEmpty;

    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(

            onPrimary: Colors.white,
            primary: isFormValid ? Colors.brown : Colors.brown.shade100
        ),
        onPressed: (){
          setData();

        },
        child: Text('Save',style: TextStyle(fontSize: 20),),
      ),
    );
  }

  showMyCupertinoDialoge(BuildContext context) {
    return showCupertinoModalPopup(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Choose Image From"),
            actions: [
              CupertinoDialogAction(
                child: Text("Camera"),
                onPressed: () {
                  getCameraImage();
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.red),
                child: Text("Gallery"),
                onPressed: () {
                  getGalleryImage();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future getGalleryImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      print(value!.path);
      if (value.path.isNotEmpty) {
        print("image selected");
        pickImage = File(value.path);
      } else {
        print('No Image Selected');
      }
      update();
    });
  }

  Future getCameraImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      print(value!.path);
      if (value.path.isNotEmpty) {
        print("image selected");
        pickImage = File(value.path);
      } else {
        print('No Image Selected');
      }
      update();
    });
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
          Icon(Icons.calendar_today_rounded, color: Colors.brown, size: 50),
          SizedBox(
            width: 10,
          ),
          Text(
              "Issue from:  ${selectedDate.day.toString().padLeft(
                  2, '0')}-${selectedDate.month.toString().padLeft(
                  2, '0')}-${selectedDate.year}",
              style: TextStyle(fontSize: 17))
          // Text(
          //     UtilsVariable.scheduled, style: UtilsVariable.taskStyle)
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    print(selectedDate
        .compareTo(DateTime.now())
        .isNegative);
    final DateTime? selected = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(primary: Colors.brown),
          ),
          child: child ?? Text(""),
        );
      },
      context: context,
      initialDate:
      (selectedDate
          .compareTo(DateTime.now())
          .isNegative)
          ? DateTime.now()
          : selectedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      update();
    }
  }



}
