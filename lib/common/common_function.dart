import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

showToast({String? msg = "", Color? color}) {
  return Get.snackbar(
    "SortOut",
    msg!,
    backgroundColor: color ?? Colors.black.withOpacity(0.2),
    snackPosition: SnackPosition.TOP,
  );

}

CircularProgressIndicator circularLoader() {
  return CircularProgressIndicator(
    color: Colors.brown,
  );
}

class CustomDialogs {
  static CustomDialogs? _shared;

  CustomDialogs._();

  static CustomDialogs get getInstance =>
      _shared = _shared ?? CustomDialogs._();

  showCircularIndicator({
    double size = 80.0,
  }) {
    return SpinKitPulse(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.brown,
          ),
        );
      },
      // color: ColorConstants.primaryColor,
      size: size,
    );
  }

  void showProgressDialog() {
    ProgressDialog2.showLoadingDialog(isBarrierDismissible: false);
  }

  void hideProgressDialog() {
    Get.back();
  }
}

class ProgressDialog2 {
  static Future<void> showLoadingDialog(
      {bool isBarrierDismissible = false}) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: isBarrierDismissible,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return isBarrierDismissible;
            },
            child: Center(child: circularLoader()));
      },
    );
  }
}
