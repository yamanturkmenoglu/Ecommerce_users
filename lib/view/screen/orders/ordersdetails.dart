import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_eticaret/controller/orders/ordersdetails_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Appcolor.white,
          centerTitle: true,
          title: const Text(
            "Sipariş Detayları",
            style: TextStyle(
              fontSize: 24, // Yazı tipini büyüttük
              color: Appcolor.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
            color: Appcolor.white,
            padding: const EdgeInsets.all(15),
            child: GetBuilder<OrdersDetailsController>(
                builder: (controller) => Handilingdataview(
                      statusRequest: controller.statusRequest,
                      widget: ListView(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Table(
                            children: [
                              const TableRow(children: [
                                Text("Ürün",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Appcolor.orange,
                                        fontWeight: FontWeight.bold)),
                                Text("Miktar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Appcolor.orange,
                                        fontWeight: FontWeight.bold)),
                                Text("Fiyat",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Appcolor.orange,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              /*  TableRow(children: [
                    Text(
                      "mac book pro",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "2",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "33999 TL",
                      textAlign: TextAlign.center,
                    ),
                  ]), */
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].countitems}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].itemsprice}TL",
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                                "TOPLAM : ${controller.ordersModel.ordersTotalprice} TL",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Appcolor.orange,
                                    fontWeight: FontWeight.bold)),
                          ),
                          if (controller.ordersModel.ordersType == "0")
                            Card(
                              child: Container(
                                child: ListTile(
                                  title: const Text("Adress",
                                      style: TextStyle(
                                          color: Appcolor.black,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                    "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}",
                                    style: const TextStyle(color: Appcolor.gri),
                                  ),
                                ),
                              ),
                            ),
                          if (controller.ordersModel.ordersType == "0")
                            Container(
                              height: 300,
                              width: double.infinity,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.markers.toSet(),
                                initialCameraPosition:
                                    controller.cameraPosition!,
                                onMapCreated:
                                    (GoogleMapController controllermap) {
                                  controller.completercontroller
                                      .complete(controllermap);
                                },
                              ),
                            )
                        ],
                      ),
                    ))));
  }
}
