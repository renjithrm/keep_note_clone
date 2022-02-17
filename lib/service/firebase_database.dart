import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/model/user_model.dart';

class FirebaseDatabase {
  final fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _userModel = UserModel();

//save data to firebase.
  Future createDocument(String title, String content) async {
    var user = _auth.currentUser;
    try {
      fireStore.collection("user").doc(user!.uid).collection("note").add({
        "title": title,
        "content": content,
      });
    } catch (e) {
      print(e);
    }
  }

//get the stream of database value.
  Stream<List<UserModel>> getData() async* {
    var model = <UserModel>[];
    var user = _auth.currentUser;
    try {
      var result = await fireStore
          .collection("user")
          .doc(user!.uid)
          .collection("note")
          .get();
      for (var i = 0; i < result.docs.length; i++) {
        model
            .add(_userModel.fromJson(result.docs[i].data(), result.docs[i].id));
      }
      yield model;
    } catch (e) {
      print(e);
    }
  }

//delect data from firebase.
  Future delectData(String id) async {
    var user = _auth.currentUser;

    try {
      await fireStore
          .collection("user")
          .doc(user!.uid)
          .collection("note")
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

//update data in firebase.
  Future updata(String title, String content, String id) async {
    var user = _auth.currentUser;
    try {
      await fireStore
          .collection("user")
          .doc(user!.uid)
          .collection("note")
          .doc(id)
          .update({
        "title": title,
        "content": content,
      });
    } catch (e) {
      print(e);
    }
  }
}
