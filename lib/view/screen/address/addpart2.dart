import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/address/addparttowaddress_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/view/widget/address/addresstextfromfild.dart';
import 'package:get/get.dart';

class AddPartTowAddress extends StatelessWidget {
  const AddPartTowAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAdressPartTowController controller =
        Get.put(AddAdressPartTowController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Appcolor.white,
          centerTitle: true,
          title: const Text(
            " Adres Detayları Ekle",
            style: TextStyle(
              fontSize: 24, // Yazı tipini büyüttük
              color: Appcolor.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          /*   leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Appcolor.orange,
            ),
          ), */
        ),
        body: Container(
            color: Appcolor.white,
            padding: const EdgeInsets.all(15),
            child: GetBuilder<AddAdressPartTowController>(
                builder: (controller) => Handilingdataview(
                      statusRequest: controller.statusRequest,
                      widget: ListView(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          CustomTextFormAddress(
                            hinttext: 'Şehir',
                            iconData: Icons.location_city,
                            isNumber: false,
                            labeltext: 'Şehir',
                            mycontroller: controller.city,
                            valid: (val) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormAddress(
                            hinttext: 'Sokak',
                            iconData: Icons.streetview,
                            isNumber: false,
                            labeltext: 'Sokak',
                            mycontroller: controller.street,
                            valid: (val) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormAddress(
                            hinttext: 'Adresin ismi',
                            iconData: Icons.location_on_sharp,
                            isNumber: false,
                            labeltext: 'Adresin ismi',
                            mycontroller: controller.name,
                            valid: (val) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.addAddress();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolor.orange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Devam",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))));
  }
}
