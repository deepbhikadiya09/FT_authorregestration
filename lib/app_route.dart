import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/screen/addbook_screen.dart';
import 'package:untitled/screen/book_detail.dart';
import 'package:untitled/screen/showbook_screen.dart';

abstract class Routes {
  static const initial = '/';
  static const addBookScreen = '/addBookScreen';

  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => ShowBookScreen(),
    ),
    GetPage(
      name: Routes.addBookScreen,
      page: () => AddBookScreen(),
    ),
  ];
}
