import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/orders/ordersarshive_controller.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showdialogeRating(BuildContext context, String ordersid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Ürünü değerlendirin',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Derecelendirmenizi ayarlamak için bir yıldıza dokunun. İsterseniz buraya daha fazla açıklama ekleyin.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(AppImageasset.logo),
      submitButtonText: 'Gönder',
      commentHint: 'Yorum eklemeyi unutmayın',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrdersArshiveController controller = Get.find();
        controller.submitRating(ordersid, response.rating, response.comment);
      },
    ),
  );
}
