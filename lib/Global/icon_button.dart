import 'package:flutter/material.dart';


Widget Iconbutton(String img)
{
  return  Container(
    height: 50,
    width: 70,
    decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.white.withOpacity(.2),
      )
    ),
    child: Center(child: Image.asset(img,height: 20,width: 20,)),
  );
}