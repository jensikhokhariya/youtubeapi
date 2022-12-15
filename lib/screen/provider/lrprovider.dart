import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LProvider extends ChangeNotifier {
  Future<String> createuser(String email, String password)async {
    String note = "";
    var firebaseAuth = FirebaseAuth.instance;

    try{
      var res = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      note = "Success";
    }on FirebaseAuthException catch (e){
      if(e.code == "weak-password"){
        note = "Password is too short";
      }else if(e.code == "email-already-in-use"){
        note = "You are already User";
      }else{
        note = "You are already User ${e.message}";
      }
    }
    return note;
  }
  Future<String> loginuser(String email, String password)async {
    String note = "";
    var firebaseAuth = FirebaseAuth.instance;

    try{
      var res = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      note = "Success";
    }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        note = 'No user found for that email.';
      }else if(e.code == 'wrong-password'){
        note = 'Wrong password provider for that user.';
      }
    }
    return note;
  }
  bool cheakUser(){
    var firebaseAuth = FirebaseAuth.instance;
    var user = firebaseAuth.currentUser;
    if(user!=null){
      return true;
    }else{
      return false;
    }
  }
  void signOut(){
    var firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut();
    GoogleSignIn().signOut();
  }
  void googleSignIn()async{
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? user = await googleSignInAccount!.authentication;

    var crd = GoogleAuthProvider.credential(
        idToken: user.idToken,
        accessToken: user.accessToken
    );
    var firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signInWithCredential(crd);
  }

}