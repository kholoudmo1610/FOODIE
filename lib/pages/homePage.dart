import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble_custom/floating_action_bubble_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:profile_ui/pages/add.dart';
import 'package:profile_ui/pages/foodByCategory.dart';
import 'package:profile_ui/pages/foodDetails.dart';
import 'package:profile_ui/wedgets/myTitle.dart';
import 'package:profile_ui/wedgets/searchBar.dart';
import 'package:profile_ui/wedgets/sectionCard.dart';
import 'package:profile_ui/wedgets/popularFoodCard.dart';
import 'package:profile_ui/wedgets/topOfferCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../utilities/apiData.dart';
import 'package:random_string/random_string.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
List icons = [Icons.fastfood,Icons.emoji_food_beverage,Icons.egg_alt_outlined,Icons.local_pizza,Icons.rice_bowl,Icons.local_drink_rounded];
List titles=["Burger","Coffee","Egg","Pizza","Asian","Drink"];
List imgname = ["BBQ Burger", "Classic Burger", "Chicken Burger", "Spicy Burger", "Smash Burger", "Double Smash Burger", "Triple Smash Burger", "double g burger"];
List imgLink = ["https://www.eatingwell.com/thmb/aKA6WL4j01orJ6F7v9bF4PH6B7Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/air-fryer-cheeseburgers-9e0cf0071bcb4b8d9bc806cabfb61347.jpg",
  "https://th.bing.com/th/id/OIP.F8SMjIdgHJpg6E8IWbxFqAHaEO?w=294&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.9dmy_4xLDbPkob8rTntT1QHaFi?w=267&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7",
"https://th.bing.com/th/id/OIP.dvvBOfqbGbpPIwhrad87mwHaGM?w=219&h=183&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.OPW_OZbGOC7tUICZdq-noQHaFj?w=259&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.uJtbPjz0YWtkyDFf3FizoAHaEK?w=281&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.gteCSGrp_cwzsXLfyey69AHaHa?w=168&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.3Zxq-h-OVOjniYZDJQM-JwHaFQ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"

];

class _HomePageState extends State<HomePage> {

  // final user = FirebaseAuth.instance.currentUser;
  // List<dynamic> users= [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f5f9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myTitle(title: "Home", fontSize: 40),
                searchBar(),
                /*ListTile(
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Text('Top Offers'),
                        value: ,
                      )
                    ],
                  ),
                ),*/
                Container( //3mlt container 34an ana 3ndy fl screen de 3 listview
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return sectionCard(
                        icon: icons[index],
                        title: titles[index],

                        onTap: () {
                          // Add your if condition here
                          if (index == 0) {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodDetailsPage()),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodByCategory()),
                            );
                          }
                          else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodDetailsPage()),
                            );
                          }
                          else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodByCategory()),
                            );
                          }
                          else if (index == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodDetailsPage()),
                            );
                          }
                          else if (index == 5) {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => FoodByCategory()),
                            );
                          }
                          else if (index == 6) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodDetailsPage()),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: myTitle(title: "Popular Food", fontSize: 17),
                ),
                Container(
                  height: 200,
                  width: 50000,
                  child: ListView.builder(
                    itemCount: foods.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return popularFoodCard(
                        imgLink: imgLink[index],
                        imgname: imgname[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: myTitle(title: "Top Offers", fontSize: 17),
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return topOffersCard(
                        imgLink: imgLink[index],
                        imgname: imgname[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionBubble(
        items: [
          Bubble(
            title: "Food Details",
            onPress: (){
              _anima
            }
          )
        ],
        animation: ,
        onPressed: , iconColor: null,
        backgroundColor: null,
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Add()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  /*Widget buildNavigateButton() => FloatingActionButton.large(
      child: Icon(Icons.home),
      //label: const Text("Home"),
      backgroundColor: Colors.blue,
      hoverColor: Colors.white,
      foregroundColor: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      });*/
  // void fetchUsers () async{
  //   print('fetchUsers called');
  //   const url = 'https://randomuser.me/api/?results=10';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   setState(() {
  //     users = json['results'];
  //   });
  //   print('fetchUsers completed');
  // }

}


class topOffersCard extends StatelessWidget {
  final String imgLink;
  final String imgname;

  const topOffersCard({
    super.key,
    required this.imgLink,
    required this.imgname,
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
                    image: NetworkImage(imgLink),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imgname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "American Style Burger",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Text(
                "\$23.5",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 18),
              ),
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

class popularFoodCard extends StatelessWidget {
  final String imgLink;
  final String imgname;

  const popularFoodCard({
    super.key,
    required this.imgLink,
    required this.imgname,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 5),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(imgLink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            imgname,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("4.2"),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.indigo,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.indigo,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.indigo,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  Text("(12+)"),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    "\$25",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blueAccent),
                                  ),
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
    );
  }
}

class sectionCard extends StatelessWidget {
  sectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, color: Colors.blue, size: 35),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title,
                  style: TextStyle(color: Colors.indigo, fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.transparent,
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Find a food or restaurant",
              //suffixIcon: Icon(Icons.menu, color: Colors.blueAccent, size: 32,),
              prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

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
    return Text(
      title,
      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:profile_ui/wedgets/myTitle.dart';
// import 'package:profile_ui/wedgets/searchBar.dart';
// import 'package:profile_ui/wedgets/sectionCard.dart';
// import 'package:profile_ui/wedgets/popularFoodCard.dart';
// import 'package:profile_ui/wedgets/topOfferCard.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// List icons=[Icons.fastfood,Icons.emoji_food_beverage,Icons.egg_alt_outlined,Icons.local_pizza,Icons.rice_bowl,Icons.local_drink_rounded];
// List titles=["Burger","Coffee","Egg","Pizza","Asian","Drink"];
// List imgname = ["Normal burger", "Chicken burger", "Cheese burger", "fish burger", "Smashed burger", "Grilled burger", "double burger", "double g burger"];
// List imgLink = ["https://www.eatingwell.com/thmb/aKA6WL4j01orJ6F7v9bF4PH6B7Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/air-fryer-cheeseburgers-9e0cf0071bcb4b8d9bc806cabfb61347.jpg",
// "https://th.bing.com/th/id/OIP.sL4vzTHm5XTTwVZQjFHApQHaFj?w=245&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7",
// "https://th.bing.com/th/id/OIP.uJtbPjz0YWtkyDFf3FizoAHaEK?w=281&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   "https://th.bing.com/th/id/OIP.Ah8LHrAHkdfD19U-r366bAHaHV?w=193&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   "https://th.bing.com/th/id/OIP.3Zxq-h-OVOjniYZDJQM-JwHaFQ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   "https://th.bing.com/th/id/OIP.uJtbPjz0YWtkyDFf3FizoAHaEK?w=281&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   "https://th.bing.com/th/id/OIP.Ah8LHrAHkdfD19U-r366bAHaHV?w=193&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7",
//   "https://th.bing.com/th/id/OIP.3Zxq-h-OVOjniYZDJQM-JwHaFQ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
//
// ];
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfff3f5f9),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             myTitle(title: "Home", fontSize: 40),
//             searchBar(),
//             Container(   //3mlt container 34an ana 3ndy fl screen de 3 listview
//               height: 100,
//
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                   itemCount: titles.length,
//                   itemBuilder: (context,index){
//                 return sectionCard(icon: icons[index], title: titles[index]);
//               }),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
//               child: myTitle(title: "Popular Food", fontSize: 17),
//             ),
//             Container(
//               height: 200,
//               width: 50000,
//               child: ListView.builder(
//                 itemCount: 8,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context,index){
//
//                 return popularFoodCard(imgLink: imgLink[index],imgname:imgname[index]);
//               }),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
//               child: myTitle(title: "Top Offers", fontSize: 17),
//             ),
//             Container(
//               height: 400,
//               child: ListView.builder(
//                 itemCount: 8,
//                   itemBuilder: (context,index){
//                 return topOffersCard(imgLink: imgLink[index],imgname:imgname[index]);
//               }),
//             ),
//           ],
//         ),
//       ),
//       ),
//     ),
//     );
//   }
//
//
//
// }
//
// class topOffersCard extends StatelessWidget {
//   final String imgLink;
//   final String imgname;
//   const topOffersCard({
//     super.key,required this.imgLink,
//     required this.imgname
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: 200,
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                         image: NetworkImage(imgLink),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0,left: 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(imgname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                     Text("American Style Burger",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey),),
//                   ],
//                 ),
//               ),
//               Text("\$23.5",style: TextStyle(fontWeight: FontWeight.bold,color: Colors. blueAccent,fontSize: 18),),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Divider(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class popularFoodCard extends StatelessWidget {
//   final String imgLink;
//   final String imgname;
//   const popularFoodCard({
//     super.key,
//     required this.imgLink,
//     required this.imgname
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 200,
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 18.0,left: 5),
//             child: Column(
//               children: [
//                 Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       image: DecorationImage(
//                           image: NetworkImage(imgLink),
//                           fit: BoxFit.cover
//                       )
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0,left: 8.0),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(imgname,style: TextStyle(fontWeight: FontWeight.bold),),
//                           Row(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("4.2"),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.star,color: Colors.indigo,size: 18,),
//                                       Icon(Icons.star,color: Colors.indigo,size: 18,),
//                                       Icon(Icons.star,color: Colors.indigo,size: 18,),
//                                       Icon(Icons.star,color: Colors.grey,size: 18,),
//                                     ],
//                                   ),
//                                   Text("(12+)"),
//                                 ],
//                               ),
//                               SizedBox(height: 20,),
//                               Row(
//                                 children: [
//                                   Text("\$25",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blueAccent),),
//                                 ],
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class sectionCard extends StatelessWidget {
//    sectionCard({
//     super.key,
//     required this.icon,
//     required this.title,
//   });
//
//   final IconData icon;
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0,left: 8.0),
//       child: Column(
//         children: [
//           Container(
//             height: 70,
//             width: 70,
//             decoration: BoxDecoration(
//               color: Colors.white,
//              borderRadius: BorderRadius.circular(50),
//             ),
//             child: Icon(icon,color: Colors.blue,size: 35,),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(title, style: TextStyle(color: Colors.indigo,fontSize: 15),),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class searchBar extends StatelessWidget {
//   const searchBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Colors.transparent,
//           border: Border.all(color: Colors.grey),
//
//         ),
//         child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:  TextField(
//               decoration: InputDecoration(
//                 hintText: "Find a food or restaurant",
//                 suffixIcon: Icon(Icons.add_road_rounded,color: Colors.grey,),
//                 prefixIcon: Icon(Icons.search,color: Colors.blueAccent,),
//                 disabledBorder: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 errorBorder: InputBorder.none,
//               ),
//             ),
//         ),
//       ),
//     );
//   }
// }
//
// class myTitle extends StatelessWidget {
//   const myTitle({
//     super.key,
//     required this.title,
//     required this.fontSize,
//   });
//
//   final String title;
//   final double fontSize;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Text(title, style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize:fontSize),);
//   }
// }
