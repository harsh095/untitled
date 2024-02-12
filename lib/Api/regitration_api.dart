import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/const/api_url.dart';

import '../Model/regitration_model.dart';

class ApiRegister{

  Future data(String name,String email) async {

    print({
    "Name1": name.toString(),
    "Email": email.toString(),
    "Login_type": "0",
    "Role": "User"
    });

    // var body = jsonEncode({
    //   "Name": name.toString(),
    //   "Email": email.toString(),
    //   "Login_type": "0",
    //   "Role": "User"
    // });
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://api-coolbro.gvmtechnologies.com/auth/register'));
    request.body = json.encode({
      "Name": "harsh1",
      "Email": "harshbaldha.imscit20@gmail.com",
      "Login_type": "0",
      "Role": "User"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data =await jsonDecode(await response.stream.bytesToString());




    return data;
  }


}