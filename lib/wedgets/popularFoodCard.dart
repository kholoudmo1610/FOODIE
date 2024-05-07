import 'package:flutter/material.dart';
import 'package:profile_ui/pages/foodDetails.dart';

class popularFoodCard extends StatelessWidget {
  const popularFoodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        child: InkWell(
          onTap: () {
            // Add your if condition here
            if (0 == 0) {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetailsPage()),
              );
            } else if (1 == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetailsPage()),
              );
            }
            else if (2 == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetailsPage()),
              );
            }
            else if (3 == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetailsPage()),
              );
            }
            else if (4 == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetailsPage()),
              );
            }
            else if (5 == 5) {
              Navigator.push(context,MaterialPageRoute(builder: (context) => FoodDetailsPage()),
              );
            }
            else if (6 == 6) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetailsPage()),
              );
            }
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0,left: 5),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage("https://www.eatingwell.com/thmb/aKA6WL4j01orJ6F7v9bF4PH6B7Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/air-fryer-cheeseburgers-9e0cf0071bcb4b8d9bc806cabfb61347.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cheese Burger",style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("4.2"),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.indigo,size: 18,),
                                        Icon(Icons.star,color: Colors.indigo,size: 18,),
                                        Icon(Icons.star,color: Colors.indigo,size: 18,),
                                        Icon(Icons.star,color: Colors.grey,size: 18,),
                                      ],
                                    ),
                                    Text("(12+)"),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("\$25",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blueAccent),),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
