import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/myfavorite_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:flutter_eticaret/view/widget/cart/appbarcart.dart';
import 'package:flutter_eticaret/view/widget/customhome_appbar.dart';
import 'package:flutter_eticaret/view/widget/myfavorite/myfavcustomlist.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.white,
        centerTitle: true,
        title: const Text(
          "Fevorilerim",
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
      body: Container(
          color: Appcolor.white,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<MyFavoriteController>(
                builder: (controller) => Handilingdataview(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        return MyFavoritecustomList(
                          itemsmodel: controller.data[index],
                        );
                      },
                    )),
              ),
            ],
          )),
    );
  }
}
