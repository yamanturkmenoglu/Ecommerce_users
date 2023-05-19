import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/homepage_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:get/get.dart';

class Listitemshome extends GetView<HomeControllerImp> {
  const Listitemshome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: controller.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Itemshome(
                itemsmodel: Itemsmodel.fromJson(controller.items[index]),
              );
            })));
  }
}

class Itemshome extends StatelessWidget {
  final Itemsmodel itemsmodel;
  const Itemshome({Key? key, required this.itemsmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.network(
          "${Applink.imagesitems}/${itemsmodel.itemsImage}",
          height: 120,
          width: 120,
          fit: BoxFit.fill,
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Appcolor.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        height: 130,
        width: 170,
      ),
      Positioned(
          right: 33,
          bottom: 33,
          child: Text(
            "${itemsmodel.itemsName}",
            style: const TextStyle(
                color: Appcolor.gri,
                // fontWeight: FontWeight.bold,
                fontSize: 14),
          ))
    ]);
  }
}
