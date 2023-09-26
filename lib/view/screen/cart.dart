import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/cart_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/view/widget/cart/appbarcart.dart';
import 'package:flutter_eticaret/view/widget/cart/custombottomnavigationbarcart.dart';
import 'package:flutter_eticaret/view/widget/cart/customitemslistcart.dart';
import 'package:flutter_eticaret/view/widget/cart/topcardcart.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustomBottomNavigationBarcart(
            price: "${cartController.priceorders}",
            discount: "${controller.discountcoupon}%",
            totalprice: "${controller.getTotalPrice()}",
            controllercoupon: controller.controllercoupon!,
            onApplaycoupon: () {
              controller.checkcoupon();
            },
            shipping: '0.0',
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Appcolor.white,
          centerTitle: true,
          title: const Text(
            "Sepetim",
            style: TextStyle(
              fontSize: 24, // Yazı tipini büyüttük
              color: Appcolor.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          /*  leading: IconButton(
          onPressed: () {
            Get.toNamed(Approute.profile);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Appcolor.orange,
          ),
        ), */
        ),
        body: GetBuilder<CartController>(
            builder: ((controller) => Handilingdataview(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: Appcolor.white,
                  child: ListView(
                    children: [
                      /*  AppBarCart(
                        title: "Sepetim",
                        onpressed: () {
                          Get.toNamed(Approute.homepage);
                        },
                      ), */
                      const SizedBox(
                        height: 10,
                      ),
                      TopCardCart(
                          massege:
                              "Sepette ${cartController.totalcountitems} Ürün Mevcüt"),
                      const SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                        cartController.data.length,
                        (index) => CustomItemsListCart(
                          name: "${cartController.data[index].itemsName}",
                          price: "${cartController.data[index].itemsprice}",
                          count: "${cartController.data[index].countitems}",
                          imagename: "${cartController.data[index].itemsImage}",
                          onadd: () async {
                            await cartController
                                .addToCart(cartController.data[index].itemsId!);
                            cartController.refreshPage();
                          },
                          onremove: () async {
                            await cartController.removeOnCart(
                                cartController.data[index].itemsId!);
                            cartController.refreshPage();
                          },
                        ),
                      )
                    ],
                  ),
                )))));
  }
}
