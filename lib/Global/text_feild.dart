import 'package:flutter/material.dart';
import 'package:untitled/const/text_style.dart';

import '../const/Colors.dart';

Widget TextFeild(TextEditingController controller,BuildContext context,String hint)
{
  return Container(

    height: 60,
    decoration: BoxDecoration(
      color: textfeild_color,
      borderRadius: BorderRadius.circular(12)
    ),
    child: TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: WhiteRegStyle,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: WhiteRegStyle,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 20),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
            border
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color:
              Colors.white
          ),
        ),

      ),
    ),
  );
}