import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/fevorite_controller.dart';
import 'package:flutter_eticaret/controller/items_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/functions/translatedatabase.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final Itemsmodel itemsmodel;

  const CustomListItems({
    Key? key,
    required this.itemsmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProdutScreen(itemsmodel);
      },
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Padding(
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
                          const Text("Rating 0.0 ",
                              textAlign: TextAlign.center),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              if (itemsmodel.itemsDiscuont != "0")
                                Text(
                                  "${itemsmodel.itemsPrice} ₺",
                                  style: const TextStyle(
                                    color: Appcolor.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans",
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness:
                                        2.0, // Çizgi çizme özelliği
                                  ),
                                ),
                              Text(
                                "${itemsmodel.itemspricediscuont} ₺",
                                style: const TextStyle(
                                  color: Appcolor.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans",
                                ),
                              ),
                            ],
                          ),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    if (controller
                                            .isFavorite[itemsmodel.itemsId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsmodel.itemsId, "0");
                                      controller
                                          .removeFavorite(itemsmodel.itemsId!);
                                    } else {
                                      controller.setFavorite(
                                          itemsmodel.itemsId, "1");
                                      controller
                                          .addFavorite(itemsmodel.itemsId!);
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsmodel.itemsId] ==
                                            "1"
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: Appcolor.orange,
                                  )))
                        ],
                      )
                    ]),
              ),
              if (itemsmodel.itemsDiscuont != "0")
                Positioned(
                  top: 5,
                  left: 5,
                  child: Image.asset(
                    AppImageasset.sale,
                    width: 40,
                  ),
                )
            ],
          )),
    );
  }
}
