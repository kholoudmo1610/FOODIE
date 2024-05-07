import 'package:flutter/material.dart';
import 'package:profile_ui/wedgets/myTitle.dart';
import 'package:profile_ui/wedgets/topOfferCard.dart';
import 'package:profile_ui/wedgets/sectionCard.dart';
import 'package:profile_ui/pages/login.dart';
class FoodByCategory extends StatefulWidget {
  // final String title;

  const FoodByCategory();

  @override
  State<FoodByCategory> createState() => _FoodByCategoryState();
}

class _FoodByCategoryState extends State<FoodByCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            myTitle(title:  " Category", fontSize: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(itemBuilder: (context,index){

                return topOffersCard();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: buildNavigateButton(),
    );
  }
  Widget buildNavigateButton() => FloatingActionButton.large(
      child: Icon(Icons.home),
      //label: const Text("Home"),
      backgroundColor: Colors.blue,
      hoverColor: Colors.white,
      foregroundColor: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      });
}
