// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profile_ui/pages/homePage.dart';
import 'package:profile_ui/pages/login.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   body: StreamBuilder<User?>(
      //  stream: FirebaseAuth.instance.authStateChanges(),
       // builder: ((context, snapshot) {
         // if (snapshot.hasData){
           // return HomePage();
          //} else {
            body:  LoginPage()
          //}
    //    }),
    //   ),
    );
  }
}
