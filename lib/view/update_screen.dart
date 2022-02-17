// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/firebase_controller.dart';
import 'package:notes_app/constant/reuse_functions.dart';
import 'package:notes_app/service/firebase_database.dart';
import 'package:notes_app/view/full_notes_screen.dart';

class UpdareScreen extends StatelessWidget {
  String? title;
  String? content;
  String id;
  UpdareScreen({
    Key? key,
    this.title,
    this.content,
    required this.id,
  }) : super(key: key);
  Widget div = SizedBox(
    height: 10,
  );

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = title ??= "";
    _contentController.text = content ??= "";
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      smallText("Titel"),
                      div,
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                            hintText: "Add title.....",
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "**requried";
                          }
                          return null;
                        },
                      ),
                      div,
                      smallText("Content"),
                      div,
                      TextFormField(
                        controller: _contentController,
                        maxLines: 8,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Add Content.....",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "**requried";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
              div,
              div,
              div,
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await FirebaseDatabase().updata(
                                    _titleController.text,
                                    _contentController.text,
                                    id);
                                Get.find<FirebaseController>().update(["home"]);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => NoteScreen(
                                            title: _titleController.text,
                                            content: _contentController.text,
                                            id: id)));
                                // Navigator.of(context).pop();
                              } else {
                                debugPrint("not validate");
                              }
                            },
                            child: Text("Save"))),
                    Expanded(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Cancel")))
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
