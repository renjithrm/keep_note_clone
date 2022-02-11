// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app/constant/reuse_functions.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  Widget div = SizedBox(
    height: 10,
  );
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
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
                        },
                      )
                    ],
                  ),
                ),
              ),
              div,
              div,
              div,
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("validate");
                              } else {
                                print("not validate");
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
