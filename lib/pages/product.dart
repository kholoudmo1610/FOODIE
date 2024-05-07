// ignore_for_file: unused_import

import 'package:flutter/material.dart' ;
import 'package:profile_ui/wedgets/popularFoodCard.dart' ;
class Product {
  int id , rate ;
  String title , subTitle , description , image ;



  Product(
      {required this.id ,
        required this.rate,
        required this.title,
        required this.subTitle,
        required this.description,
        required this.image, }
      );

}

List<Product> products = [

  Product(
    id:1 ,
    rate:5,
    title:"Burger Restaurant" ,
    subTitle: "",
    image:"images/images/Restaurant1B.jpg" ,
    description:"Each meal contain one sandwish & fries" ,
  ),

  Product(
    id:2 ,
    rate:5,
    title:"Pizza Restaurant" ,
    subTitle: "",
    image:"images/images/Restaurant2P.jpg" ,
    description:"Each meal contain three slices of pizza" ,
  ),

  Product(
    id:3 ,
    rate:5,
    title:"Shawarmaa Restaurant" ,
    subTitle: "",
    image:"images/images/Restaurant3SH.jpg" ,
    description:"Each meal contain one sandwish & fries" ,
  ),
] ;