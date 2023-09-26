import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/linkipa.dart';

class CustomItemsListCart extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onadd;
  final void Function()? onremove;
  const CustomItemsListCart(
      {Key? key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,
      required this.onadd,
      required this.onremove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Kenarları yuvarlak hale getirdik
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${Applink.imagesitems}/$imagename",
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("$price TL",
                    style: const TextStyle(
                        color: Appcolor.orange, fontWeight: FontWeight.w400)),
              )),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.all(4), // Butonlara biraz boşluk ekledik
                  child: IconButton(
                    onPressed: onadd,
                    iconSize: 30, // Buton simgesini büyüttük
                    icon: const Icon(
                      Icons.add_circle,
                      color: Appcolor.orange,
                    ),
                  ),
                ),
                Text(
                  count,
                  style:
                      const TextStyle(fontSize: 20), // Metin boyutunu küçülttük
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(4), // Butonlara biraz boşluk ekledik
                  child: IconButton(
                    onPressed: onremove,
                    iconSize: 30, // Buton simgesini büyüttük
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Appcolor.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
