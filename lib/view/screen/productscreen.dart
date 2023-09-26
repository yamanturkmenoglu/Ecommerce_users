import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/cart_controller.dart';
import 'package:flutter_eticaret/controller/product_screen_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/view/widget/product/colorlistproduct.dart';
import 'package:flutter_eticaret/view/widget/product/priceandcount.dart';
import 'package:flutter_eticaret/view/widget/product/productdesc.dart';
import 'package:flutter_eticaret/view/widget/product/productname.dart';
import 'package:flutter_eticaret/view/widget/product/toppageproductscreen.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductScreencontrollerIpm controller =
        Get.put(ProductScreencontrollerIpm());
    Get.put(CartController());

    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 3),
            textColor: Colors.white,
            onPressed: () {
              Get.toNamed(Approute.cart);
              controller.cartController.updateData();
            },
            color: Appcolor.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            splashColor: Colors.white,
            child: const Text(
              "Sepete Git",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: GetBuilder<ProductScreencontrollerIpm>(
            builder: (controller) => Handilingdataview(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const TopPageProductScreen(),
                      const Divider(
                        height: 0,
                        color: Appcolor.gribox,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ProductName(),
                            const SizedBox(height: 10),
                            PriceAndCount(
                              count: "${controller.countitems}",
                              onadd: () {
                                controller.add();
                              },
                              onremov: () {
                                controller.remove();
                              },
                              price:
                                  "${controller.itemsmodel.itemspricediscuont}",
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "64".tr,
                              style: const TextStyle(
                                  color: Appcolor.orange2,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ProductDesc(),
                            const SizedBox(
                              height: 10,
                            ),
                            /* const Text(
                              "COLOR : ",
                              style: TextStyle(
                                  color: Appcolor.orange2,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ColorListPrpduct(), */
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
