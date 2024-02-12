import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:untitled/Controller/otphandle.dart';
import 'package:untitled/const/api_url.dart';
import 'package:http/http.dart' as http;

import '../Api/otp_apis.dart';
import '../Global/Text_wigets.dart';
import '../Global/icon_button.dart';
import '../Model/regitration_model.dart';
import '../Model/verify_model.dart';
import '../const/Colors.dart';
import '../const/img_urls.dart';
import '../const/text_style.dart';
class OtpSCreen extends StatefulWidget {
  const OtpSCreen({super.key,required this.id,required this.email});
  final String? id;
  final String? email;

  @override
  State<OtpSCreen> createState() => _OtpSCreenState();
}

class _OtpSCreenState extends State<OtpSCreen> {
  TextEditingController Otp=TextEditingController();
  OtpController _controller=Get.put(OtpController());

  VerifyOtpModel? model;
  @override
  void initState() {
    _controller.startTimer();
    super.initState();
  }

  Future<void> Resend()
  async {
    var request = http.Request('POST', Uri.parse(sendotp_url));
    var headers = {
      'Content-Type': 'application/json'
    };

    request.body = json.encode({
      "Email": widget.email,
      "Login_type": "0"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data =await jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      if (data['message'] == "OTP has been sent successfully!")
      {

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


  void Verifyotp()
  {
    VerifyOtp().data(widget.id.toString(), Otp.text.toString()).then((value)
    async {
      print("Data"+value.toString());
      model=value;
      Fluttertoast.showToast(msg: model!.message.toString());





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
              SizedBox(height: mid.height * .05,),
              Image.asset(OtpImgUrl,height: mid.height * .2,width: mid.width * .5,fit: BoxFit.fill,),
              SizedBox(height: mid.height * .04,),
              HeaderTextWhite("OTP Verification"),
              SizedBox(height: mid.height * .03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("We have sent an OTP to your phone number !",textAlign: TextAlign.center,style: WhiteRegStyle,),
              ),

              SizedBox(height: mid.height * .03,),


                PinCodeFields(
                  length: 4,
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  fieldBorderStyle: FieldBorderStyle.square,
                  borderRadius: BorderRadius.circular(12),

                  padding: EdgeInsets.symmetric(vertical: 8),
                  textStyle: TextStyle(color: Colors.white,fontSize: 34),
                  obscureText: true,
                  activeBackgroundColor: Color(0xff45427D),

                  controller: Otp,
                  keyboardType:  TextInputType.number,
                  activeBorderColor: Colors.white,
                    borderColor: Colors.white,
                  fieldBackgroundColor: Color(0xff45427D),

                  animation: Animations.shrink,

                  onComplete: (String value) {  },
                ),


              SizedBox(height: mid.height * .16,),



              Obx(()
              {
                return Column(
                  children: [
                    Text("00:${_controller.start.value.toString()} Sec",style: WhiteRegStyle,),
                    SizedBox(height: mid.height * .02,),
                    if(_controller.resend.value==true)

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't receive OTP ?",style: WhiteRegStyle,),
                          InkWell(
                              onTap: ()
                              {
                               Resend();
                              },
                              child: Text(" Resend OTP",style: BlueTextMed,))
                        ],
                      ),

                  ],
                );
              }),

              SizedBox(height: mid.height * .14,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background color
                  onPrimary: Colors.black, // text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  print(Otp.text.toString());
                    if(Otp.text.toString()!="")
                      {
                        Verifyotp();
                      }
                    else
                      {
                        Fluttertoast.showToast(msg: "Please Enter Otp!");
                      }
                },
                child: Container(
                  width: mid.width,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Verify",
                      style: ButtonText,
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
