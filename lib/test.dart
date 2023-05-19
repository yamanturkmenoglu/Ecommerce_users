import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/checkinternet.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;

  intialdata() async {
    res = await checkinternet();
    print(res);
  }

  @override
  void initState() {
    intialdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              OtpTextField(
                fieldWidth: 60,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                filled: true,
                fillColor: Appcolor.gribox,
                numberOfFields: 5,
                focusedBorderColor: Appcolor.orange,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
            ])));
  }
}
