import 'package:hive_flutter/adapters.dart';
import 'package:profile_ui/pages/boxes.dart';
import 'package:profile_ui/pages/foodByCategory.dart';
import 'package:profile_ui/pages/homePage.dart';
import 'package:profile_ui/pages/login.dart';
import 'package:profile_ui/pages/person.dart';
import 'package:profile_ui/pages/signup.dart';
import 'package:profile_ui/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:profile_ui/pages/auth.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:random_string/random_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Auth(),
      initialRoute: 'welcomePage',
      routes: {
        'welcomePage': (context)=> WelcomePage(),
        'signup' : (context)=> SignupApp(),
        'login' : (context)=> LoginApp(),
      },
    );
  }
}
