import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/translatedatabase.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:flutter_eticaret/view/widget/customhome_appbar.dart';
import 'package:flutter_eticaret/view/widget/home/discountitemslisthome.dart';
import 'package:flutter_eticaret/view/widget/home/itemsforyouitemslist.dart';
import 'package:flutter_eticaret/view/widget/home/listcategories.dart';
import 'package:flutter_eticaret/view/widget/home/swipercardhome.dart';
import 'package:flutter_eticaret/view/widget/home/titleonehome.dart';
import 'package:flutter_eticaret/view/widget/home/topsellingitemslisthome.dart';
import 'package:get/get.dart';

import '../../controller/homepage_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            color: Appcolor.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(children: [
              // ignore: prefer_const_constructors
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
              Handilingdataview(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Swipercardhome(
                              titel: controller.titlehomeCard,
                              subtitle: controller.bodyhomecard,
                            ),
                            Titleonehome(title: "62".tr),
                            const SizedBox(height: 5),
                            const Listcategories(),
                            const SizedBox(height: 5),
                            Titleonehome(title: "60".tr),
                            const SizedBox(height: 10),
                            const DiscountItemsListHome(),
                            //const SizedBox(height: 10),
                            Titleonehome(title: "61".tr),
                            const SizedBox(height: 5),
                            const ItemsForYouListHome(),
                            Titleonehome(title: "63".tr),
                            const SizedBox(height: 5),
                            const TopSellingItemsListHome(),
                          ],
                        )
                      : ListItemsSearch(listdatamodel: controller.listdata))
            ])));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<Itemsmodel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listdatamodel.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToProdutScreen(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imagesitems}/${listdatamodel[index].itemsImage}",
                        fit: BoxFit.cover,
                      )),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15),
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(
                            translateDatabase(
                                listdatamodel[index].categoriesNameTr!,
                                listdatamodel[index].categoriesName!),
                            style: const TextStyle(color: Appcolor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
