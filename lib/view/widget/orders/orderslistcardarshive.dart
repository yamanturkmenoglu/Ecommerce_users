import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/orders/ordersarshive_controller.dart';
import 'package:flutter_eticaret/controller/orders/orderspending_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/data/model/ordersmodel.dart';
import 'package:flutter_eticaret/view/widget/orders/rating.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArshive extends GetView<OrdersArshiveController> {
  final OrdersModel listdata;
  const CardOrdersListArshive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Sipaeiş Codu : #${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      color: Appcolor.orange, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
            Text(
                "Teslimat Tipi : ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Ürünün Fiyatı : ${listdata.ordersPrice}"),
            Text("Gönderim Ücreti : ${listdata.ordersPricedelivery} TL"),
            Text(
                "Ödeme Tipi : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            Text(
                "Siparişin Durumu : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text("Toplam Fiyat : ${listdata.ordersTotalprice} TL",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.orange)),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(Approute.ordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  child: const Text("Detaylar"),
                  color: Appcolor.orange,
                  textColor: Appcolor.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (listdata.ordersRating == "0")
                  MaterialButton(
                    onPressed: () {
                      showdialogeRating(context, listdata.ordersId!);
                    },
                    child: const Text("değerlendir"),
                    color: Appcolor.orange,
                    textColor: Appcolor.white,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
