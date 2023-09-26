import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/cart_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/view/widget/cart/bottumcard.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBarcart extends GetView<CartController> {
  final String discount;
  final String price;
  final String totalprice;
  final String shipping;
  final TextEditingController controllercoupon;
  final void Function()? onApplaycoupon;

  const CustomBottomNavigationBarcart({
    Key? key,
    required this.discount,
    required this.price,
    required this.totalprice,
    required this.controllercoupon,
    required this.onApplaycoupon,
    required this.shipping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              hintText: "Coupon Code",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: MaterialButton(
                              color: Appcolor.orange,
                              textColor: Colors.white,
                              onPressed: onApplaycoupon,
                              child: const Text(
                                "Uygula",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Container(
                      child: Text(
                        "${controller.couponname!} kupon Ürüne Uygulandı",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Appcolor.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Ara Toplam",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "$price TL",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "indirim",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "$discount ",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Kargo",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "$shipping TL",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Appcolor.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Toplam",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.orange,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    "$totalprice TL",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.orange,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            BottumCart(
              onPressed: () {
                controller.goToPageCheckout();
              },
              text: 'Sepeti Onayla',
            ),
          ],
        ),
      ],
    );
  }
}
