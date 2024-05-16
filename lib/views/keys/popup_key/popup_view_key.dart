import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/model/keys_model.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:intl/intl.dart';
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
  TextEditingController _dateCreatedController  = TextEditingController();

  bool isPassVisible = false;

  @override
  void initState() {
    super.initState();
    _keyNameController.text = widget.keysData.imageName;
    _descriptionNameController.text = widget.keysData.description;
    _categoryNameController.text = widget.keysData.categoryName;
//2024-05-10T16:03:24.410Z"
    var dateString = widget.keysData.createdAt;
    var dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(dateString);

    _dateCreatedController.text = DateFormat('d MMMM yyyy hh:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    double sizeW=MediaQuery.of(context).size.width/2.4;
    double sizeH=MediaQuery.of(context).size.height/1.1;
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
        width: sizeW,

        decoration: const BoxDecoration(
            color: ColorConsts.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 18, 6),
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
                    controller: _dateCreatedController,
                    isPassVisible: false,
                    labelText: "Key added on",
                    prefixIconData: Icons.calendar_month,
                    hintText: '',
                  )),
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

            Container(
              padding: const EdgeInsets.only( top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:  Image.network(
                        widget.keysData.imagePath,
                        height: sizeH/3.33,
                        width: sizeW/3.6,
                        fit: BoxFit.cover ,errorBuilder: (context, error, stackTrace) {
                        return Container(color: ColorConsts.primaryColor,
                          height: sizeH/3.33,
                          width: sizeW/3.6,
                        );
                      },
                      )),
                      SizedBox(height: 3),
                      Text("Front Image" , style: ThemeText.textMediumSecondary,),
                      SizedBox(height: 3),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:   Image.network(
                        widget.keysData.backImagePath,
                        height: sizeH/3.4,
                        width: sizeW/3.6,
                        fit: BoxFit.cover
                          ,errorBuilder: (context, error, stackTrace) {
                          return Container(color: ColorConsts.primaryColor,
                            height: sizeH/3.4,
                            width: sizeW/3.6,
                          );
                        },
                      )),
                      SizedBox(height: 3),
                      Text("Back Image" , style: ThemeText.textMediumSecondary,),
                      SizedBox(height: 3),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:   Image.network(
                        widget.keysData.lockImagePath,
                        height: sizeH/3.4,
                        width: sizeW/3.6,
                        fit: BoxFit.cover
                      ,errorBuilder: (context, error, stackTrace) {
        return Container(color: ColorConsts.primaryColor,
        height: sizeH/3.33,
        width: sizeW/3.6,
        );
        },
                      )),
                      SizedBox(height: 3),
                      Text("Lock Image" , style: ThemeText.textMediumSecondary,),
                      SizedBox(height: 3),
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
