import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/const/api_url.dart';

import '../Model/regitration_model.dart';
import '../Model/verify_model.dart';

class VerifyOtp {
  Future<VerifyOtpModel> data(String id, String otp) async {
    print({"ID": id.toString(), "Otp": otp.toString()});
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://api-coolbro.gvmtechnologies.com/auth/verify_otp'));
    request.body = json.encode(
        {"ID": int.parse(id.toString()), "Otp": int.parse(otp.toString())});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    Map<String, dynamic> map =
        await jsonDecode(await response.stream.bytesToString());
    final data = VerifyOtpModel.fromJson(map);
    return data;
  }
}
