import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ITIproject/MainScreen.dart';
import 'package:untitled/auth_screens/LoginScreen.dart';
import 'package:untitled/models/products_model.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context,snapshot){
          if(snapshot.hasData){
            return Mainscreen();
    }else{
            return LoginScreen();
    }
    }
      )
      )
    );
  }
}
