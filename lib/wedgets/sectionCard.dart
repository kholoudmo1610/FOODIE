import 'package:flutter/material.dart';
import 'package:profile_ui/pages/foodByCategory.dart';
import 'package:profile_ui/pages/login.dart';

class sectionCard extends StatelessWidget {
  const sectionCard({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 8.0),
      child: ElevatedButton(  //keda ana 7wlt el wedget l button
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodByCategory(title)));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginApp()));


        },
        child: Column(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FoodByCategory()));
                }, child: null, 
              ),
            ),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon,color: Colors.blue,size: 35,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title, style: TextStyle(color: Colors.indigo,fontSize: 15),),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                           FoodByCategory()));
                // Navigate to sign-up page
              }, child: null,

            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FoodByCategory()));
                // Navigate to login page
              },
              child: null,
            ),
          ],
        ),
      ),
    );
  }
}