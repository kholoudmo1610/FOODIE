import 'package:flutter/material.dart';
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
          child:  TextField(
            decoration: InputDecoration(
              hintText: "Find a food or restaurant",
              suffixIcon: Icon(Icons.add_road_rounded,color: Colors.grey,),
              prefixIcon: Icon(Icons.search,color: Colors.blueAccent,),
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