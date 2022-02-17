import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//convert into user model
  // convertUser(UserCredential? result) {
  //   result != null ? UserModel(uid: result.) : null;
  // }

//sign with email and password.
  Future signInEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return result;
    } catch (e) {
      return null;
    }
  }

//register with email and password.
  Future resgister(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;

      return result;
    } catch (e) {
      return null;
    }
  }

//sign out.
  Future singOut() async {
    return await _auth.signOut();
  }
}
