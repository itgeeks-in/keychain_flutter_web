import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/model/keys_model.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';

class PopUpViewKey extends StatefulWidget {
  final KeysData keysData;
  const PopUpViewKey({super.key,required this.keysData});

  @override
  State<PopUpViewKey> createState() => _PopUpViewKeyState();
}

class _PopUpViewKeyState extends State<PopUpViewKey> {
  String categoryIdSelect="";
  TextEditingController _keyNameController =  TextEditingController();
  TextEditingController _descriptionNameController = TextEditingController();
  TextEditingController _categoryNameController  = TextEditingController();

  bool isPassVisible = false;

  @override
  void initState() {
    super.initState();
    _keyNameController.text = widget.keysData.imageName;
    _descriptionNameController.text = widget.keysData.description;
    _categoryNameController.text = widget.keysData.categoryName;
  }

  @override
  Widget build(BuildContext context) {
    double sizeW=MediaQuery.of(context).size.width/2.4;
    double sizeH=MediaQuery.of(context).size.height/1.3;
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
        width: sizeW,
        height: sizeH,
        decoration: const BoxDecoration(
            color: ColorConsts.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      color: ColorConsts.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: const Text(
                "Key Details",
                style: ThemeText.textLargeSecondaryBold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:25, right: 25, top: 20),
              child: Center(
                  child: CustomTextField(
                    enable: false,
                    controller: _keyNameController,
                    isPassVisible: false,
                    labelText: "Key name",
                    prefixIconData: Icons.vpn_key_outlined,
                    hintText: '',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: CustomTextField(
                enable: false,
                prefixIconData: Icons.description_outlined,
                isPassVisible: false,
                controller: _descriptionNameController,
                labelText: "Description",
                hintText:'',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 20),
              child: Center(
                  child: CustomTextField(
                    enable: false,
                    controller: _categoryNameController,
                    isPassVisible: false,
                    labelText: "Category name",
                    prefixIconData: Icons.vpn_key_outlined,
                    hintText: '',
                  )),
            ),
            SizedBox(height: 5,),
            Container(
              padding: const EdgeInsets.only( top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.network(
                        widget.keysData.imagePath,
                        height: sizeH/3,
                        width: sizeW/3.6,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text("Front Image" , style: ThemeText.textMediumSecondary,),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        widget.keysData.backImagePath,
                        height: sizeH/3,
                        width: sizeW/3.6,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text("Back Image" , style: ThemeText.textMediumSecondary,),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        widget.keysData.lockImagePath,
                        height: sizeH/3,
                        width: sizeW/3.6,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text("Lock Image" , style: ThemeText.textMediumSecondary,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
