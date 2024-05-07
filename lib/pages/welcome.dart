import 'package:flutter/material.dart';
import 'package:profile_ui/pages/signup.dart';
import 'package:profile_ui/pages/login.dart';



void main() {
  runApp(WelcomePage());
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Page',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(68, 180, 255, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              //Image.asset('images/logo_s.png'),

              //Title
              
              //Subtitle
              
              //Email Textfield
              
              //Password Texfield
              
              // Signin button
              
              //Text: sign up
              Text(
                'FOODIE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                           SignupPage()));
                  // Navigate to sign-up page
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 10.0),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginApp()));
                  // Navigate to login page
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}