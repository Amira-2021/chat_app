import 'package:chatapp/screens/account/connector.dart';
import 'package:chatapp/shared/components/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class creeteAccountViewModel extends ChangeNotifier{
  late Connector connector;
  void createAccountFirebaseAuth(String email,String password)async{
    try {
      connector.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      connector.hideLoading();
      connector.showMessage("Account Created Successfully",Colors.green);

    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weak_password) {
        connector.hideLoading();
        connector.showMessage("The password provided is too weak.",Colors.orange);
      } else if (e.code == FirebaseError.email_use) {
        connector.hideLoading();
        connector.showMessage("The account already exists for that email.",Colors.yellow);
      }
    } catch (e) {
      connector.hideLoading();
      connector.showMessage(e.toString(),Colors.red);
    }
  }
}