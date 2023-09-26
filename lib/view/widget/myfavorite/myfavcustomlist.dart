import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/myfavorite_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/translatedatabase.dart';
import 'package:flutter_eticaret/data/model/Myfavorite.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:get/get.dart';

class MyFavoritecustomList extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsmodel;

  const MyFavoritecustomList({
    Key? key,
    required this.itemsmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemsmodel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Applink.imagesitems}/${itemsmodel.itemsImage!}",
                    height: 110,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  translateDatabase(
                      itemsmodel.itemsNameTr!, itemsmodel.itemsName!),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Appcolor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Rating 3.5 ", textAlign: TextAlign.center),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 17,
                      child: Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    size: 15,
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
                //const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsmodel.itemsPrice} ₺",
                          style: const TextStyle(
                              color: Appcolor.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            controller
                                .deleteFromFavorite(itemsmodel.favoriteId!);
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: Appcolor.orange,
                          ))
                    ])
              ]),
        ),
      ),
    );
  }
}
