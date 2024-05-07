import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  Future addFoodDetails (Map<String, dynamic> foodInfoMap, String id)async{
    return await FirebaseFirestore.instance
        .collection("Food")
        .doc(id)
        .set(foodInfoMap);
  }
}