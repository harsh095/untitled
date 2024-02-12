import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:untitled/Api/otp_apis.dart';
import 'package:untitled/Global/Text_wigets.dart';
import 'package:untitled/const/api_url.dart';
import 'package:untitled/const/img_urls.dart';
import 'package:untitled/const/text_style.dart';
import '../Api/regitration_api.dart';
import '../Global/icon_button.dart';
import '../Global/text_feild.dart';
import '../Model/regitration_model.dart';
import '../const/Colors.dart';
import 'login_Screen.dart';
import 'package:http/http.dart' as http;

import 'otp_screen.dart';

class RegitrationPage extends StatefulWidget {
  const RegitrationPage({super.key});

  @override
  State<RegitrationPage> createState() => _RegitrationPageState();
}

class _RegitrationPageState extends State<RegitrationPage> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  RegisterModel? model;
  bool islod=false;
  Future<void> SendOtp(String email)
  async {
    var request = http.Request('POST', Uri.parse(sendotp_url));
    var headers = {
      'Content-Type': 'application/json'
    };

    request.body = json.encode({
      "Email": email,
      "Login_type": "0"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data =await jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      if (data['message'] == "OTP has been sent successfully!")
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtpSCreen(id: data['ID'].toString(), email:_emailController.text ,)),
        );

        Fluttertoast.showToast(msg: data['message'].toString());
      }
      else {
        Fluttertoast.showToast(msg: data['message'].toString());
      }
    }
    else {
      Fluttertoast.showToast(msg: data['message'].toString());
    }
  }

  void RegApi()
  {
    islod=true;
    setState(() {

    });
    ApiRegister().data(_nameController.text, _emailController.text).then((value) {
      Map<String, dynamic> map = value;
      model= RegisterModel.fromJson(map);

      print("Harshdg"+model!.message.toString());

      if(model!.message=="User registered successfully!")
        {
         SendOtp(model!.user!.email.toString());
          Fluttertoast.showToast(msg: model!.message.toString());
        }else
          {
            Fluttertoast.showToast(msg: model!.message.toString());
          }

    });
    islod=false;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    final mid=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: main_color,
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: mid.height * .2,),
              Image.asset(LogoImgUrl,height: mid.height * .05 ,),
              SizedBox(height: mid.height * .04,),
              HeaderTextWhite("Register"),
              SizedBox(height: mid.height * .03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Just fill up details below and you are good to go !",textAlign: TextAlign.center,style: WhiteRegStyle,),
              ),

              SizedBox(height: mid.height * .03,),
              TextFeild(_nameController,context,"Enter Your Name"),
              SizedBox(height: mid.height * .03,),
              TextFeild(_emailController,context,"Enter Email Address"),
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
                  // if(_emailController.text!=null&&_nameController.text!=null)
                  //   {
                  //     RegApi();
                  //   }
                  // else
                  //   {
                  //    Fluttertoast.showToast(msg: "All Feild are require");
                  //   }
                     if(_emailController.text.isNotEmpty)
                       {
                         SendOtp(_emailController.text);
                       }
                     else
                       {
                         Fluttertoast.showToast(msg: "Email are require");
                       }
                },
                child: Container(
                  width: mid.width,
                  height: 50,
                  child: Center(
                    child: islod?CircularProgressIndicator(color: main_color,):Text(
                      "Sign Up",
                      style: ButtonText,
                    ),
                  ),
                ),
              ),

              SizedBox(height: mid.height * .07,),

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
                        print("object");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(" Log In",style: BlueTextMed,))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
