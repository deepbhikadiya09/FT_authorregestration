import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_route.dart';
import '../theme/app_text_theme.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    gotoNext();
    super.initState();
  }

  gotoNext()async{
    Future.delayed(const Duration(milliseconds: 2500), () async {
      await Get.offAllNamed(Routes.onBoarding);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("asset/img/splash.jpg",height: 200,),
          ),
          Text("myAuthorRegestration",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1.1),)

        ],
      ),
    );
  }
}
