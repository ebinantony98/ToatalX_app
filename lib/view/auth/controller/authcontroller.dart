import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toatlx_machine_test/view/homescreen/view/home_screen.dart';

class AuthController extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  int secondsLeft = 60;
  late Timer timer;
  final formKey = GlobalKey<FormState>();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (secondsLeft == 0) {
        timer.cancel();
      } else {
        secondsLeft--;
        notifyListeners();
      }
    });
  }

  validateAndNavigate(context) {
    final form = formKey.currentState;
    if (form?.validate() ?? false) {
      form?.save();
      if (otpController.text == "123456") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid OTP'),
          ),
        );
      }
    }
  }
}
