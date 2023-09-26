import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/fevorite_controller.dart';
import 'package:flutter_eticaret/controller/items_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:flutter_eticaret/view/screen/home.dart';
import 'package:flutter_eticaret/view/widget/customhome_appbar.dart';
import 'package:flutter_eticaret/view/widget/items/customlistitems.dart';
import 'package:flutter_eticaret/view/widget/items/listcategoriesitems.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
        body: Container(
      color: Appcolor.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          Homeappbar(
            mycontroller: controller.search!,
            titleappbar: "57".tr,
            onPressedIconnotifi: () {
              Get.toNamed(Approute.notificationpage);
            },
            onPressedSearch: () {
              controller.onSearchitems();
            },
            onChanged: (val) {
              controller.chechsearch(val);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const ListcategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (contrller) => Handilingdataview(
                  statusRequest: contrller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contrller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.6),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isFavorite[contrller.data[index]
                                    ['items_id']] =
                                contrller.data[index]['favorite'];
                            return CustomListItems(
                              itemsmodel:
                                  Itemsmodel.fromJson(contrller.data[index]),
                            );
                          })
                      : ListItemsSearch(listdatamodel: controller.listdata))),
        ],
      ),
    ));
  }
}
