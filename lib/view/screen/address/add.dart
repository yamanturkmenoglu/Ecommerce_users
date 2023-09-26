import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/address/addaddress_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAdressController controllerpage = Get.put(AddAdressController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.white,
        centerTitle: true,
        title: const Text(
          " Yeni Adresim",
          style: TextStyle(
            fontSize: 24, // Yazı tipini büyüttük
            color: Appcolor.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        /*  leading: IconButton(
          onPressed: () {
            Get.toNamed(Approute.profile);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Appcolor.orange,
          ),
        ), */
      ),
      body: Container(
          child: GetBuilder<AddAdressController>(
              builder: ((controllerpage) => Handilingdataview(
                    statusRequest: controllerpage.statusRequest,
                    widget: Column(
                      children: [
                        if (controllerpage.kGooglePlex != null)
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                GoogleMap(
                                  mapType: MapType.normal,
                                  markers: controllerpage.markers.toSet(),
                                  onTap: (latlong) {
                                    controllerpage.addMarkers(latlong);
                                  },
                                  initialCameraPosition:
                                      controllerpage.kGooglePlex!,
                                  onMapCreated:
                                      (GoogleMapController controllermap) {
                                    controllerpage.completercontroller!
                                        .complete(controllermap);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controllerpage
                                          .goToPageAddDetailsAddress();
                                    },
                                    child: Text(
                                      "Devam",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Appcolor.orange,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  )))),
    );
  }
}
