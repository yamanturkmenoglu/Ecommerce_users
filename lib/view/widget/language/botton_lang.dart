import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

//language sayfasında botton tasarımı içerir screende bulunan language.dart ta claas olarak çağırılacak
class Bottonlang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const Bottonlang({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        child: MaterialButton(
          color: Appcolor.orange,
          textColor: Colors.white,
          onPressed: onPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          splashColor: Colors.white,
          child: Text(
            textbutton,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
