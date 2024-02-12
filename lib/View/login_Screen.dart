import 'package:flutter/material.dart';

import '../Global/Text_wigets.dart';
import '../Global/icon_button.dart';
import '../Global/text_feild.dart';
import '../const/Colors.dart';
import '../const/img_urls.dart';
import '../const/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _EmailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mid=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: main_color,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: mid.height * .2,),
            Image.asset(LogoImgUrl,height: mid.height * .05 ,),
            SizedBox(height: mid.height * .04,),
            HeaderTextWhite("Welcome"),
            SizedBox(height: mid.height * .03,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Login with your phone number and access our services",textAlign: TextAlign.center,style: WhiteRegStyle,),
            ),

            SizedBox(height: mid.height * .03,),
            TextFeild(_EmailController,context,"Enter Email Address"),

            SizedBox(height: mid.height * .03,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // background color
                onPrimary: Colors.black, // text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {

              },
              child: Container(
                width: mid.width,
                height: 50,
                child: Center(
                  child: Text(
                    "Login",
                    style: ButtonText,
                  ),
                ),
              ),
            ),

            SizedBox(height: mid.height * .18,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 1,color: Colors.white.withOpacity(.5),width: mid.width * .25,),
                Text("Or continue with",style:WhiteMedStyle ,),
                Container(height: 1,color: Colors.white.withOpacity(.5),width: mid.width * .25,),
              ],
            ),
            SizedBox(height: mid.height * .02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Iconbutton(GoogleImgUrl),
                Iconbutton(AppleImgUrl),
                Iconbutton(FaceBookImgUrl),
              ],
            ),
            SizedBox(height: mid.height * .05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",style: WhiteRegStyle,),
                InkWell(
                    onTap: ()
                    {
                        Navigator.pop(context);
                    },
                    child: Text(" Sing Up",style: BlueTextMed,))
              ],
            )


          ],
        ),
      ),
    );
  }
}