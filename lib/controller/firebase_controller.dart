import 'package:get/get.dart';

class FirebaseController extends GetxController {
  bool isAuthpage = true;

  void toggleView() {
    isAuthpage = !isAuthpage;
    update(["signin"]);
  } //get data from the firebase.

}
