import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
class CategoryPageUI extends StatefulWidget {
  const CategoryPageUI({super.key});

  @override
  State<CategoryPageUI> createState() => _CategoryPageUIState();
}

class _CategoryPageUIState extends State<CategoryPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
         padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
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
            ElevatedButton(
              onPressed: () {
              },
              child: const Text(
                'Add Category',
                style:ThemeText.textSmallWhiteBold,
              ),
               style: ElevatedButton.styleFrom(
                shadowColor: ColorConsts.primaryColor,
                elevation: 10,
                backgroundColor: ColorConsts.primaryColor,
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),

    );
  }
}