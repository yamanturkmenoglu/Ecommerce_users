import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/address/view_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Appcolor.white,
          centerTitle: true,
          title: const Text(
            "Adreslerim",
            style: TextStyle(
              fontSize: 24, // Yazı tipini büyüttük
              color: Appcolor.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          /* leading: IconButton(
            onPressed: () {
              Get.toNamed(Approute.profile);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Appcolor.orange,
            ),
          ), */
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Approute.addressadd);
          },
          child: Icon(Icons.add),
          backgroundColor: Appcolor.orange,
        ),
        body: GetBuilder<AddressViewController>(
            builder: ((controller) => Handilingdataview(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: EdgeInsets.only(top: 25),
                      child: ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (context, i) {
                            return CardAddress(
                              addressModel: controller.data[i],
                              onDelete: () {
                                controller.deleteAddress(
                                    controller.data[i].addressId!);
                              },
                            );
                          })),
                ))));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;

  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[200],
        child: ListTile(
          title: Text(
            addressModel.addressName!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "${addressModel.addressCity!} ${addressModel.addressStreet}",
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline,
              color: Appcolor.orange,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
