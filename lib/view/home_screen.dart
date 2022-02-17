// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/controller/firebase_controller.dart';
import 'package:notes_app/model/user_model.dart';
import 'package:notes_app/service/firebase_auth.dart';
import 'package:notes_app/service/firebase_database.dart';
import 'package:notes_app/view/add_screen.dart';
import 'package:notes_app/view/widgets/home_display_banner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final FirebaseService _auth = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        title: Text(
          "Notes",
          style: GoogleFonts.rowdies(color: Colors.black),
        ),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.singOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              label: Text(
                "logout",
                style: GoogleFonts.rowdies(
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: GetBuilder<FirebaseController>(
        id: "home",
        init: FirebaseController(),
        builder: (_) {
          return StreamBuilder<List<UserModel>>(
              stream: FirebaseDatabase().getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("error"),
                  );
                } else if (snapshot.hasData) {
                  return snapshot.data!.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            String title = snapshot.data![index].title ??= "";
                            String content =
                                snapshot.data![index].content ??= "";
                            String id = snapshot.data![index].uid.toString();
                            return HomeBanner(
                                title: title, content: content, id: id);
                          },
                          itemCount: snapshot.data!.length,
                        )
                      : Center(
                          child: Text(
                          "Add notes",
                          style:
                              GoogleFonts.rowdies(fontWeight: FontWeight.bold),
                        ));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddScreen())),
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.green,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.check_box_outlined),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.color_lens_outlined),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.mic_outlined),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.photo_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
