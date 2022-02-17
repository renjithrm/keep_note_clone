import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/controller/firebase_controller.dart';
import 'package:notes_app/constant/reuse_functions.dart';
import 'package:notes_app/service/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  Widget div(double size) => SizedBox(
        height: size,
      );
  final _auth = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.rowdies(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            div(30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  textFormField(
                    username,
                    (value) {
                      if (value!.isEmpty) {
                        return "**requried";
                      } else {
                        return null;
                      }
                    },
                    "Enter user name",
                    TextInputType.emailAddress,
                    false,
                  ),
                  div(30),
                  textFormField(
                    password,
                    (value) {
                      if (value!.isEmpty) {
                        return "**requried";
                      } else {
                        return null;
                      }
                    },
                    "Enter password",
                    TextInputType.visiblePassword,
                    true,
                  ),
                ],
              ),
            ),
            div(60),
            Column(
              children: <Widget>[
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var result = await _auth.signInEmailAndPassword(
                              username.text, password.text);
                          if (result == null) {
                          } else {}
                        }
                      },
                      child: const Text("Login in")),
                ),
                div(20),
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: TextButton(
                    onPressed: () {
                      Get.find<FirebaseController>().toggleView();
                    },
                    child: const Text("Register now"),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
