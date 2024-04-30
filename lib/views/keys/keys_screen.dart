import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpAddKeys.dart';

import 'package:key_admin_panel/views/keys/pop_ups_key/popUpEditKey.dart';
import 'package:key_admin_panel/views/keys/pop_ups_key/popUpViewKeys.dart';


class KeyPageUI extends StatefulWidget {
 const KeyPageUI({super.key});

  @override
  State<KeyPageUI> createState() => _KeyPageUIState();
}

class _KeyPageUIState extends State<KeyPageUI> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 185, 216),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 185, 216)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Colors.black45, width: 2),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_search_sharp,
                            color: Color.fromARGB(255, 8, 185, 216),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  RoundedButton(
                    btnName: "Add Keys +",
                    callback: () {
                      showDialog(
                        context: context,
                        builder: (context) => const PopUpAddKeys(),
                      );
                    },
                  )
                ],
              ),
            ),
            KeyHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 8, 185, 216),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(193, 223, 212, 212),
                            blurRadius: 8,
                            spreadRadius: 4,
                          )
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(child: Image.asset("assets/keys.jpg",fit: BoxFit.fill,),
                            )),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text(
                              "Dumpy Key",
                              style: ThemeText.textSmallBlack,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(right: 35),
                            child: const Text(
                              "Door Key",
                              style: ThemeText.textSmallBlack,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.blue,
                            child: const Text(
                              "A document description is a USPTO-defined description of forms and documents that are received and processed in the USPTO.",
                              style: ThemeText.textSmallGrey,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                        const PopUpViewKey(),
                                      );
                                    },
                                    child: Text(
                                      'View',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.white),
                                      backgroundColor:
                                      Color.fromARGB(255, 8, 185, 216),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => PopUpEditkey(),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shadowColor:
                                    Color.fromARGB(255, 8, 185, 216),
                                    elevation: 10,
                                    backgroundColor:
                                    Color.fromARGB(255, 8, 185, 216),
                                    shape: CircleBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class KeyHeader extends StatelessWidget {
  const KeyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 2,
          color: Color.fromARGB(255, 8, 185, 216),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(193, 223, 212, 212),
            blurRadius: 8,
            spreadRadius: 4,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Image", style: ThemeText.textMediumBlack, textAlign: TextAlign.start,),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Key Name", style: ThemeText.textMediumBlack, textAlign: TextAlign.start,),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Category", style: ThemeText.textMediumBlack, textAlign: TextAlign.start,),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Description", style: ThemeText.textMediumBlack, textAlign: TextAlign.start,),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Action", style: ThemeText.textMediumBlack, textAlign: TextAlign.start,),
            ),
          ),
        ],
      ),
    );
  }
}