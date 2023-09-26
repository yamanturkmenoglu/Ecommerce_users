import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class Homeappbar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconnotifi;
  final void Function()? onPressedSearch;
  final Function(String)? onChanged;
  final TextEditingController mycontroller;
  const Homeappbar(
      {Key? key,
      required this.titleappbar,
      this.onPressedIconnotifi,
      this.onPressedSearch,
      this.onChanged,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(top: 20),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  color: Appcolor.orange,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(Icons.search),
                  onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 50,
          height: 50,
          child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: onPressedIconnotifi,
              icon: const Icon(
                Icons.notifications_active_outlined,
                size: 25,
                color: Appcolor.orange,
              )),
        )
      ]),
    );
  }
}
