import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBookController extends GetxController{
  final bookNameController = TextEditingController();
  FocusNode bookNameFocusNode = FocusNode();
  final authorNameController = TextEditingController();
  FocusNode authorNameFocusNode = FocusNode();
  final aboutAuthorController = TextEditingController();
  FocusNode aboutAuthorFocusNode = FocusNode();
  final aboutBookController = TextEditingController();
  FocusNode aboutBookFocusNode = FocusNode();
  final ratingController = TextEditingController();
  FocusNode ratingFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();

}