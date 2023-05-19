import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class Textfromfildlogin extends StatelessWidget {
  final String hinttext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isnumber;

  const Textfromfildlogin({
    Key? key,
    required this.hinttext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isnumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
          keyboardType: isnumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: valid,
          controller: mycontroller,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(color: Appcolor.gri),
            filled: true,
            fillColor: Appcolor.gribox,
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
