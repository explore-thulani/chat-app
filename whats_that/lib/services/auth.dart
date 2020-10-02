import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_that/services/database.dart';
import 'package:whats_that/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in anon
  Future signInAnon() async {
    try {
      User result = await _auth.signInAnonymously() as User;
      User user = result;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //SignIn with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      User result = await _auth.signInWithEmailAndPassword(
          email: email, password: password) as User;
      User user = result;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      User result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password) as User;
      User user = result;
      await DatabaseService(uid: user.uid)
          .updateUserData('Anon', 'Unknown', 'Unknown', 'None');
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //Create user object based on FirebaseUser
  Users _userFromFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<Users> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }
}
