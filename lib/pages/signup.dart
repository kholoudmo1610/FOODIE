import 'package:flutter/material.dart';
import 'package:profile_ui/pages/homePage.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(SignupApp());
}

class SignupApp extends StatefulWidget {
  @override
  State<SignupApp> createState() => _SignupAppState();
}

class _SignupAppState extends State<SignupApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey <FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 36, 188, 253), Color.fromARGB(255, 36, 188, 253)],
          ),
        ),
        child: Center(
          child: Form(
            key: formState,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: username,
                    validator: (val) {
                      if (val == "") {
                        return "Can't Be Empty";
                      }
                      return null; // Return null if validation succeeds
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val == "") {
                        return "Can't Be Empty";
                      }
                      return null; // Return null if validation succeeds
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    validator: (val) {
                      if (val == "") {
                        return "Can't Be Empty";
                      }
                      return null; // Return null if validation succeeds
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async{
                      if(formState.currentState!.validate())
                      {
                        try {
                          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email:email.text ,
                            password: password.text,
                          );

                          Navigator.of(context).pushReplacementNamed("login");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'The password provided is too weak.',
                            ).show();
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'The account already exists for that email.',
                            ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}