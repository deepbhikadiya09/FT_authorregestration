import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:untitled/app_route.dart';


class AddBookController extends GetxController {
  final bookNameController = TextEditingController();
  FocusNode bookNameFocusNode = FocusNode();
  final authorNameController = TextEditingController();
  FocusNode authorNameFocusNode = FocusNode();
  final aboutAuthorController = TextEditingController();
  FocusNode aboutAuthorFocusNode = FocusNode();
  final aboutBookController = TextEditingController();
  FocusNode aboutBookFocusNode = FocusNode();
  // final ratingController = TextEditingController();
  // FocusNode ratingFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();
  File? pickImage;
  UploadTask? uploadTask;
  FirebaseDatabase database = FirebaseDatabase.instance;
  double rating=1.0;
  //upload a image in firebase storage
  // Future uploadPic() async{
  //   String fileName = basename(pickImage!.path);
  //   final ref = FirebaseStorage.instance.ref().child(fileName);
  //   uploadTask = ref.putFile(pickImage!);
  //   final taskSnapshot=await uploadTask!.whenComplete((){});
  //   print("file uploded");
  //   update();
  // }


  setData(){
    database.ref().child('database').push().set({
      "image": pickImage!.path,
      "bookName" : bookNameController.text,
      "authorName" : authorNameController.text,
      "aboutAuthor" : aboutAuthorController.text,
      "aboutBook": aboutBookController.text,
      "rating": rating,
      "date":"${selectedDate.day.toString()}/${selectedDate.month.toString()} /${selectedDate.year.toString()}",
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
          // uploadPic();
          setData();
          Get.offAndToNamed(Routes.initial);
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
            content: Text("Hello!! this is content"),
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
