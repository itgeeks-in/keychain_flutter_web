import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';

class PopupViewUser extends StatefulWidget {
  const PopupViewUser({super.key});

  @override
  State<PopupViewUser> createState() => _PopupViewUserState();
}

class _PopupViewUserState extends State<PopupViewUser> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 500,
      height: 600,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(21))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: const Text(
          //     "Profile",
          //     style: TextStyle(fontSize: 20, color: Colors.black),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_outlined,
                    // size: 30,
                    color: Color.fromARGB(255, 8, 185, 216),
                  ),
                )
              ],
            ),
          ),

          Center(
            child: Container(
              width: 140,
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/images.jpg", fit: BoxFit.cover),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              labelText: "Enter your Name",
              prefixIconData: Icons.person_add_outlined,
              hintText: "Enter your Name",
            )),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              labelText: "Enter your Email",
              prefixIconData: Icons.email_outlined,
              hintText: "Enter your Email",
            )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              labelText: "Enter your Mob.",
              prefixIconData: Icons.phone_forwarded_sharp,
              hintText: "Enter your Mob.",
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 90, top: 20),
                child: Column(
                  children: [
                    Text(
                      "Total Key : 12 ",
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
