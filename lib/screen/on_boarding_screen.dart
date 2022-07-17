// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';


import '../app_route.dart';
import '../theme/math_utils.dart';

class OnBoardingScreen extends StatefulWidget {
  final bool isFromSetting;
  OnBoardingScreen({this.isFromSetting = false});
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

//   final EnumonbordingScreenDone enumonbordingScreenDone = Get.arguments;
// //this is for introduction screen.......
  void _onIntroEnd(context) {
    Get.offAllNamed(Routes.showBookScreen);
  }

  Widget _buildImage(String assetName, [double width = 350.0]) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 65.0),
        child: Image.asset(
            '$assetName',
            height: 500,
            width: 300,//double.infinity,
            fit: BoxFit.fill
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle = TextStyle(fontSize: 16);

    PageDecoration pageDecoration = PageDecoration(
        bodyTextStyle: bodyStyle,
        titlePadding: EdgeInsets.zero,
        imagePadding: EdgeInsets.zero,
        imageFlex: 1,
        bodyAlignment: Alignment.center,
        bodyFlex: 0,
        fullScreen: true
    );

    List<PageViewModel> pages = [
      PageViewModel(
        titleWidget:Container(),
        bodyWidget: Container(),
        image: _buildImage(
          'asset/img/6.jpg',
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        titleWidget:Container(),
        bodyWidget: Container(),
        image: _buildImage('asset/img/5.jpg'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        titleWidget:Container(),
        bodyWidget: Container(),
        image: _buildImage('asset/img/4.jpg'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        titleWidget:Container(),
        bodyWidget: Container(),
        image: _buildImage('asset/img/3.jpg'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        titleWidget:Container(),
        bodyWidget: Container(),
        image: _buildImage('asset/img/1.jpg'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        titleWidget:Container(),
        bodyWidget: Container(),
        image: _buildImage('asset/img/2.jpg'),
        decoration: pageDecoration,
      ),
    ];

    return IntroductionScreen(
      globalBackgroundColor:Colors.brown.shade100,
      key: introKey,
      pages: pages,
      onDone: () => _onIntroEnd(context),
      globalHeader: Container(),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: Size(30.0, 10.0),
        activeColor: Colors.brown,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      showSkipButton: true,
      nextFlex: 0,
      skip: Text(
        "Skip",
        style: TextStyle(color: Colors.black),
      ),
      next: Text(
        "Next",
        style: TextStyle(color: Colors.black),
      ),
      done: const Text('Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: EdgeInsets.only(
        bottom: 5,
      ),
      controlsPadding: EdgeInsets.only(
        bottom: 5,
      ),
    );
  }
}
