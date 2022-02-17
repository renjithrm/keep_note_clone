import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/firebase_controller.dart';
import 'package:notes_app/view/home_screen.dart';
import 'package:notes_app/view/login_screen.dart';
import 'package:notes_app/view/register_screen.dart';
import 'package:notes_app/view/authentication.dart';
import 'package:notes_app/view/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
