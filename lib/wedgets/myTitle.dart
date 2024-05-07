import 'package:flutter/material.dart';

class myTitle extends StatelessWidget {
  const myTitle({
    super.key,
    required this.title,
    required this.fontSize,
  });

  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {


    return Text(title, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:fontSize),);
  }
}