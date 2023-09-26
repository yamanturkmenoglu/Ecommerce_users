import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/settings_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      body: Container(
        color: Appcolor.white,
        child: ListView(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Appcolor.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(180),
                    bottomRight: Radius.circular(180),
                  ),
                ),
              ),
              const Positioned(
                right: 119,
                child: Text(
                  "Ayarlarım",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Appcolor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                right: 110,
                top: 80,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Appcolor.white, width: 12),
                    shape: BoxShape.circle,
                    color: Appcolor.white,
                    image: const DecorationImage(
                      image: AssetImage(AppImageasset.logo),
                    ),
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 80,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    /* const Divider(), */
                    /*  ListTile(
                      title: const Text("Bildirimleri kapat"),
                      trailing: Transform.scale(
                        scale: 0.5,
                        child: LiteRollingSwitch(
                          value: true,
                          textOn: "on",
                          textOff: "off",
                          colorOn: Colors.greenAccent,
                          colorOff: Colors.redAccent,
                          iconOff: Icons.alarm_off,
                          iconOn: Icons.done,
                          onChanged: (bool position) {
                            print("object $position");
                          },
                          onDoubleTap: () {},
                          onSwipe: () {},
                          onTap: () {},
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                    ), */
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Approute.addressview);
                      },
                      title: const Text("Adresler"),
                      trailing: const Icon(
                        Icons.location_on_outlined,
                        color: Appcolor.orange,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Approute.orderspanding);
                      },
                      title: const Text("Siparişler"),
                      trailing: const Icon(
                        Icons.shopping_basket_outlined,
                        color: Appcolor.orange,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Approute.ordersarshive);
                      },
                      title: const Text("Arşiv"),
                      trailing: const Icon(
                        Icons.archive_sharp,
                        color: Appcolor.orange,
                      ),
                    ),
                    /* const SizedBox(
                      height: 10,
                    ), */
                    /*  const Divider(),
                    ListTile(
                      onTap: () {},
                      title: const Text("Hakkımızda"),
                      trailing: const Icon(
                        Icons.contact_support_outlined,
                        color: Appcolor.orange,
                      ),
                    ), */
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        launchUrl(Uri.parse("tel: +555555"));
                      },
                      title: const Text("Bize Ulaşın"),
                      trailing: const Icon(
                        Icons.phone_callback_rounded,
                        color: Appcolor.orange,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        controller.logout();
                      },
                      title: const Text("oturumu Kapat"),
                      trailing: const Icon(
                        Icons.exit_to_app_rounded,
                        color: Appcolor.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
