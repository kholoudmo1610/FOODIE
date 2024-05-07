import 'package:flutter/material.dart';


class topOffersCard extends StatelessWidget {
  const topOffersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 200,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage("https://www.eatingwell.com/thmb/aKA6WL4j01orJ6F7v9bF4PH6B7Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/air-fryer-cheeseburgers-9e0cf0071bcb4b8d9bc806cabfb61347.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cheese Burger",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("American Style Burger",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                  ],
                ),
              ),
              Text("\$23.5",style: TextStyle(fontWeight: FontWeight.bold,color: Colors. blueAccent,fontSize: 18),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}