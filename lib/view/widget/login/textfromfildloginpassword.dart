import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';

class Textfromfildloginpassword extends StatelessWidget {
  final String hinttext;
  final IconData iconData;
  final IconData iconpass;
  final TextEditingController? mycontroller;
  final bool? obscureText;
  final void Function()? onTapicon;
  const Textfromfildloginpassword({
    Key? key,
    this.obscureText,
    this.onTapicon,
    required this.hinttext,
    required this.iconData,
    required this.mycontroller,
    required this.iconpass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "45".tr;
            }
            const passwordPattern =
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
            final passwordValid = RegExp(passwordPattern).hasMatch(value);
            if (!passwordValid) {
              return "46".tr;
            }
            return null;
          },
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          controller: mycontroller,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(color: Appcolor.gri),
            filled: true,
            fillColor: Appcolor.gribox,
            suffixIcon: InkWell(
              onTap: onTapicon,
              child: Icon(iconpass),
            ),
            prefixIcon: Icon(
              iconData,
              color: Appcolor.orange,
            ),
            focusColor: Appcolor.orange,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )),
          )),
    );
  }
}
