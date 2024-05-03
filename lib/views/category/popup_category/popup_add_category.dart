import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/widgets/buttons.dart';
import 'package:key_admin_panel/widgets/text_field_custom.dart';
class PopupAddCategory extends StatefulWidget {
  const PopupAddCategory({super.key});

  @override
  State<PopupAddCategory> createState() => _PopupAddCategoryState();
}

class _PopupAddCategoryState extends State<PopupAddCategory> {
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:  Container(
        height:300,
        width:250,
         // height: MediaQuery.of(context).size.height * 0.4,
         // width:  MediaQuery.of(context).size.width * 0.1,
         padding: EdgeInsets.all(10.0),
         decoration:  BoxDecoration(
           color: ColorConsts.whiteColor,
           borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
           mainAxisSize: MainAxisSize.max,
           children: [
             Padding(
               padding: const EdgeInsets.all(1.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   InkWell(
                     onTap: () {
                       Navigator.pop(context);
                     },
                     child: Icon(
                       Icons.close_outlined,
                       color: ColorConsts.secondaryColor,
                     ),
                   ),
                 ],
               ),
             ),
             Text(
               "Add Category",
               style: ThemeText.textLargeSecondaryBold,
             ),
             SizedBox(height: 30,),
             Container(
               child: TextFieldCustom().textFieldWidget(categoryController,TextInputType.text, 'Enter category name'),
             ),
             SizedBox(height: 10,),
             ButtonWidget().buttonWidgetSmallPrimary('Add', () => null, 120.0,40.0),
           ],
        ),
      ),
    );
  }
}
