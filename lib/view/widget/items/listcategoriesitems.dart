import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/items_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/translatedatabase.dart';
import 'package:flutter_eticaret/data/model/categoriesmodel.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListcategoriesItems extends GetView<ItemsControllerImp> {
  const ListcategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.separated(
            separatorBuilder: ((context, index) => const SizedBox(
                  width: 10,
                )),
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Categories(
                i: index,
                categoriesmodel:
                    Categoriesmodel.fromJson(controller.categories[index]),
              );
            })));
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;
  const Categories({Key? key, required this.categoriesmodel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesmodel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: 50,
              child: SvgPicture.network(
                "${Applink.imagestCategories}/${categoriesmodel.categoriesImage}",
              )),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    padding: const EdgeInsets.only(bottom: 3),
                    decoration: controller.selectedCat == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: Appcolor.orange)))
                        : null,
                    child: Text(
                        "${translateDatabase(categoriesmodel.categoriesNameTr, categoriesmodel.categoriesName)}",
                        style:
                            const TextStyle(fontSize: 14, color: Appcolor.gri)),
                  ))
        ],
      ),
    );
  }
}
