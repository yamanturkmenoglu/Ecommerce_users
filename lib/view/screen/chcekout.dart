import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/checkout_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/view/widget/cart/appbarcart.dart';
import 'package:flutter_eticaret/view/widget/checkout/cartaddresscheckout.dart';
import 'package:flutter_eticaret/view/widget/checkout/cartdeliverytapecheckout.dart';
import 'package:flutter_eticaret/view/widget/checkout/cartpymentmethod.dart';
import 'package:get/get.dart';

class ChcekOutcart extends StatelessWidget {
  const ChcekOutcart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
            onPressed: () {
              controller.checkout();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Appcolor.white,
              backgroundColor: Appcolor.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
              child: Text(
                "Onayla",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Appcolor.white,
          centerTitle: true,
          title: const Text(
            "Ödeme",
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
        body: GetBuilder<CheckoutController>(
            builder: (controller) => Handilingdataview(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    color: Appcolor.white,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Ödeme Seçenekleri",
                          style: TextStyle(
                              color: Appcolor.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("0"); //0 => cash
                          },
                          child: CartPymentMethodCheckout(
                            title: 'Nakit',
                            isActive:
                                controller.paymentMethod == "0" ? true : false,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller
                                .choosePaymentMethod("1"); //1 => payment card
                          },
                          child: CartPymentMethodCheckout(
                            isActive:
                                controller.paymentMethod == "1" ? true : false,
                            title: 'Kart ile öde',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Teslimat Seçenekleri",
                          style: TextStyle(
                              color: Appcolor.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliveryType("0"); //0 => delivery
                              },
                              child: CartDeliveryTapeCheckout(
                                imagename: AppImageasset.delivery1,
                                isActive: controller.deliveryType == "0"
                                    ? true
                                    : false,
                                title: 'Kurye ile',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliveryType("1"); //1 => recive
                              },
                              child: CartDeliveryTapeCheckout(
                                imagename: AppImageasset.stor,
                                isActive: controller.deliveryType == "1"
                                    ? true
                                    : false,
                                title: 'Mağzadan',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        if (controller.deliveryType == "0")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Teslimat adresi",
                                style: TextStyle(
                                    color: Appcolor.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ...List.generate(
                                controller.dataaddress.length,
                                (index) => InkWell(
                                  onTap: () {
                                    controller.chooseShippingAddress(controller
                                        .dataaddress[index].addressId!);
                                  },
                                  child: CartAddressCheckout(
                                    bady:
                                        "${controller.dataaddress[index].addressCity}"
                                        "${controller.dataaddress[index].addressStreet}",
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    isActive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                        ? true
                                        : false,
                                  ),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                )));
  }
}
