// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/constant/reuse_functions.dart';
import 'package:notes_app/view/full_notes_screen.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NoteScreen())),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black54,
              ),
              borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height * 0.04,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment(-1, 0),
                  padding: EdgeInsets.all(20),
                  child: text("title")),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.black38),
                  )),
                  padding: EdgeInsets.all(7),
                  width: double.infinity,
                  child: text("content"),
                ),
              )
            ],
          )),
    );
  }
}
