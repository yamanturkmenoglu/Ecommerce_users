import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/homepage_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/translatedatabase.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:get/get.dart';

class TopSellingItemsListHome extends GetView<HomeControllerImp> {
  const TopSellingItemsListHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: controller.topsellingitems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Itemshome(
                itemsmodel:
                    Itemsmodel.fromJson(controller.topsellingitems[index]),
              );
            })));
  }
}

class Itemshome extends GetView<HomeControllerImp> {
  final Itemsmodel itemsmodel;
  const Itemshome({Key? key, required this.itemsmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProdutScreen(itemsmodel);
      },
      child: Stack(
        children: [
          SizedBox(
            width: 170,
            height: 130,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: "${Applink.imagesitems}/${itemsmodel.itemsImage}",
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: 170,
            height: 130,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Appcolor.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Container(
              width: 170,
              alignment: Alignment.center,
              child: Text(
                "${translateDatabase(itemsmodel.itemsNameTr, itemsmodel.itemsName)}",
                style: const TextStyle(
                  color: Appcolor.gri,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
