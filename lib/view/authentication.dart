import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/firebase_controller.dart';
import 'package:notes_app/view/login_screen.dart';
import 'package:notes_app/view/register_screen.dart';

class Authentication extends StatelessWidget {
  Authentication({Key? key}) : super(key: key);
  FirebaseController firebaseController = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirebaseController>(
        id: "signin",
        builder: (_) {
          if (firebaseController.isAuthpage) {
            return LoginScreen();
          } else {
            return RegisterScreen();
          }
        });
  }
}
