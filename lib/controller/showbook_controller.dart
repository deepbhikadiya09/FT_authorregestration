import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ShowBookController extends GetxController {
  final databaseRef = FirebaseDatabase.instance.ref('database');
  List<dynamic> finalData = [];


  getdata() {
    databaseRef.get().then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          print(value);

          finalData.add(value);
          update();
        });
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getdata();
    super.onInit();
  }
}
