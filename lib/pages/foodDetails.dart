import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget {

  const FoodDetailsPage({super.key});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Food Recipe Name"),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0,left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: NetworkImage("https://www.eatingwell.com/thmb/aKA6WL4j01orJ6F7v9bF4PH6B7Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/air-fryer-cheeseburgers-9e0cf0071bcb4b8d9bc806cabfb61347.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cheese Burger",style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text("this is the description of the recipe : "),
                                Text(""),
                              ],
                            ),
                            Text("\$25",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blueAccent),),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
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
