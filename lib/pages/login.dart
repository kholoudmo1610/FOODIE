import 'package:flutter/material.dart';
import 'package:profile_ui/pages/homePage.dart';
import 'package:profile_ui/pages/signup.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey <FormState> formState = GlobalKey<FormState>();
  // Future signIn() async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailController.text.trim(), password: _passwordController.text.trim());
  // }

  bool _isSecurePassword= true;

  @override


  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 36, 188, 253), Color.fromARGB(255, 36, 188, 253)],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'FOODIE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
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
                    obscureText: _isSecurePassword,
                    controller: password,
                    validator: (val) {
                      if (val == "") {
                        return "Can't Be Empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: togglePassword(),
                    ),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: ()async{

                      if(formState.currentState!.validate())
                      {
                        print("hhh");
                        try {

                          setState(() {

                          });
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text

                          );
                          setState(() {

                          });
                          {
                            print("lllllll");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );                          }

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'No user found for that email.',
                            ).show();
                          } else if (e.code == 'wrong-password') {
                            // print('Wrong password provided for that user.');
                            print("fffhgfgfhh");
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'Wrong password provided for that user.',
                            ).show();
                          } else {
                            print("kkkkk");
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: e.code,
                            ).show();
                          }
                        }
                      }
                      else
                      {
                        print("not valid");
                      }
                    },
                    child: Text('Login',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )
                      ,),
                    ),
                SizedBox(height: 20,),

                /*  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      // Navigate to sign-up page
                    },
                    child: Text('Login',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )
                      ,),
                  ),*/

                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not yet a member? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        fontSize: 18,
                    ),
                    ),
                ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                        // Navigate to sign-up page
                      },
                      child: Text('Sign up now',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,

                        ),
                      ),
                    ),
                  ],
                ),
               /* Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25),
                 child: GestureDetector(
                   onTap: signIn,
                   child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber[900],
                    //borderRadius: BorderRadius,
                  ),
                  child: Center(
              child: Text(
              'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )
              )
                    )
                  )
                  )
                )*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget togglePassword() {
    return IconButton(
      icon: Icon(
        _isSecurePassword ? Icons.visibility : Icons.visibility_off,
        color: _isSecurePassword ? Colors.blue : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
    );
  }
}