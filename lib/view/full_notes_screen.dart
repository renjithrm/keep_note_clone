import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/controller/firebase_controller.dart';
import 'package:notes_app/model/user_model.dart';
import 'package:notes_app/service/firebase_database.dart';
import 'package:notes_app/view/update_screen.dart';

class NoteScreen extends StatelessWidget {
  // int index;
  // AsyncSnapshot<List<UserModel>> snapshot;
  String title;
  String content;
  String id;
  NoteScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.id,
  }) : super(key: key);
  final _firebasedatabase = FirebaseDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await _firebasedatabase.delectData(id);
                  Get.find<FirebaseController>().update(["home"]);
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => UpdareScreen(
                            id: id,
                            title: title,
                            content: content,
                          )));
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 150,
                child: Text(
                  content,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
