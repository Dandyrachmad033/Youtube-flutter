import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:youtube/home.dart';
import 'main.dart';
import 'profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';


class authenticationservice{
  final FirebaseAuth _firebaseAuth;

  

  authenticationservice(this._firebaseAuth);

  
 

  Future<void> Keluar() async {
    _firebaseAuth.signOut();
  }


      User?user;

  Future<User?> SignIn({required String email, required String password}) async{
    try {UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    user = userCredential.user;
    return user;
  } on FirebaseAuthException catch(e){
      debugPrint(e.message ?? "Error");
      return user;
  }
  
    }

   Future<bool> SignUp({required String email,required String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch(e){
      debugPrint(e.message ?? "Error");
      return false;
    }
  }
 
  

}