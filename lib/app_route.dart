import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/screen/addbook_screen.dart';
import 'package:untitled/screen/book_detail.dart';
import 'package:untitled/screen/on_boarding_screen.dart';
import 'package:untitled/screen/showbook_screen.dart';
import 'package:untitled/screen/splash_screen.dart';

abstract class Routes {
  static const showBookScreen = '/showBookScreen';
  static const addBookScreen = '/addBookScreen';
  static const showDetailsScreen = '/showDetailsScreen';
  static const onBoarding = '/onBoarding';
  static const initial = '/';

  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.showBookScreen,
      page: () => ShowBookScreen(),
    ),
    GetPage(
      name: Routes.addBookScreen,
      page: () => AddBookScreen(),
    ),
    GetPage(
      name: Routes.showDetailsScreen,
      page: () => ShowBookDetailsScreen(),
    ),
    GetPage(
      name: Routes.onBoarding,
      page: () => OnBoardingScreen(),
    ),
  ];
}
