import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../core/constant/imageasset.dart';

// logo ve logonun altındaki yazıyı bir class içinde tasarlayıp screen de bulunan language.dart ta çağrıldı
class Langcustom extends StatelessWidget {
  const Langcustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: Image.asset(
        AppImageasset.logo,
        width: 200,
      )),
      const SizedBox(
        height: 60,
      ),
      Text("1".tr, style: Theme.of(context).textTheme.headline1)
    ]);
  }
}
