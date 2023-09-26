import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_eticaret/controller/orders/ordersdetails_controller.dart';
import 'package:flutter_eticaret/controller/orders/tracking_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/polyline.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrackingController controller = Get.put(TrackingController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Appcolor.white,
          centerTitle: true,
          title: const Text(
            "Sipariş Takibi",
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
            child: GetBuilder<TrackingController>(
                builder: (controller) => Handilingdataview(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: GoogleMap(
                                polylines: polylineSet,
                                mapType: MapType.normal,
                                markers: controller.markers.toSet(),
                                initialCameraPosition:
                                    controller.cameraPosition!,
                                onMapCreated:
                                    (GoogleMapController controllermap) {
                                  controller.gmc = controllermap;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))));
  }
}
