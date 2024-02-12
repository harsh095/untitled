import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  RxInt start = 120.obs;
  RxBool resend=false.obs;


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          resend.value=true;
          timer.cancel();

          print('Done');
        } else {
          start.value--;
          print('$start sec');
        }
      },
    );
  }
}