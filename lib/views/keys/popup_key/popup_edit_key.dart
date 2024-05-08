import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_admin_panel/model/category_model.dart';
import 'package:key_admin_panel/model/keys_model.dart';
import 'package:key_admin_panel/utils/CustomImagePicker.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_bloc.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_state.dart';
import 'package:key_admin_panel/widgets/buttons.dart';

class PopUpEditkey extends StatefulWidget {
  final KeysData keysData;
  const PopUpEditkey({Key? key,required this.keysData}) : super(key: key);

  @override
  State<PopUpEditkey> createState() => _PopUpEditkeyState();
}

class _PopUpEditkeyState extends State<PopUpEditkey> {
  String categoryIdSelect="";
  List<CategoryData> categoryList = [];
   TextEditingController _keyNameController =  TextEditingController();
   TextEditingController _descriptionNameController = TextEditingController();

   bool isPassVisible = false;
   Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  @override
  void initState() {
    super.initState();
      _keyNameController.text = widget.keysData.imageName;
      _descriptionNameController.text = widget.keysData.description;
       categoryIdSelect = widget.keysData.categoryId;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
        width: 500,
        height: 550,
        decoration: const BoxDecoration(
            color: ColorConsts.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
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
                "Edit Key",
                style: ThemeText.textLargeSecondaryBold,
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                  child: CustomTextField(
                controller: _keyNameController,
                isPassVisible: false,
                labelText: "Key name",
                prefixIconData: Icons.vpn_key_outlined,
                hintText: "Enter key name",
              )),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: CustomTextField(
                prefixIconData: Icons.description_outlined,
                isPassVisible: false,
                controller: _descriptionNameController,
                labelText: "Description",
                hintText: "Enter description",
              ),
            ),
            Container(
                height: 55,
                width: 400,
                margin: EdgeInsets.fromLTRB(50, 20, 12, 10),
                padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
                decoration: new BoxDecoration(
                    border: Border.all(
                        color: ColorConsts.primaryColor,
                        width: 1.0),
                    color: ColorConsts.whiteColor,
                    borderRadius: BorderRadius.circular(11.0),

                ),
                child:BlocProvider(
                  create: (context) => CategoryPageBloc(),
                  child: BlocBuilder<CategoryPageBloc,CategoryPageState>(builder: (context, state) {
                  if(state is CategoryLoadState){
                    return Center(child: Text("Loading Please wait...",style: ThemeText.textSmallPrimary),);
                  }
                  if(state is CategoryFailedState){
                    return Center(child: Text("Not found",style: ThemeText.textSmallPrimary),);
                  }
                  if(state is CategorySuccessState) {
                    if(state.data.length ==0){
                      return Center(child: Text("Not found any category",style: ThemeText.textSmallPrimary),);
                    }
                    categoryList = state.data;
                    if(context.read<CategoryPageBloc>().selectOptionCategory == null){
                      context.read<CategoryPageBloc>().selectOptionCategory=categoryList[0];
                    }
                  }
                  return DropdownButton<CategoryData>(
                    dropdownColor: ColorConsts.whiteColor,
                    icon: Icon(Icons.arrow_drop_down,color: ColorConsts.primaryColor,),
                    underline: const SizedBox(),
                    value: context.read<CategoryPageBloc>().selectOptionCategory,

                    items: categoryList.map((CategoryData item) {
                      if(item.categoryId == categoryIdSelect){

                        context.read<CategoryPageBloc>().selectOptionCategory=item;

                      }
                      return DropdownMenuItem<CategoryData>(
                        value: item,
                        child: Text(
                          item.categoryName, style: (item.categoryId == widget.keysData.categoryId)?ThemeText.textMediumSecondary:ThemeText.textSmallGrey,),
                      );
                    }).toList(),
                    onChanged: (CategoryData? newValue) {
                      context.read<CategoryPageBloc>().selectOptionCategory = newValue;
                      categoryIdSelect=context.read<CategoryPageBloc>().selectOptionCategory!.categoryId;
                      setState(() {
                      });
                    },
                  );
                },),
              )
            ),
            SizedBox(height: 5,),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.network(
                      widget.keysData.imagePath,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 2),
                    Text("Front Image" , style: ThemeText.textMediumSecondary,),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      widget.keysData.backImagePath,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 2),
                    Text("Back Image" , style: ThemeText.textMediumSecondary,),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      widget.keysData.lockImagePath,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 2),
                    Text("Lock Image" , style: ThemeText.textMediumSecondary,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Center(child: ButtonWidget().buttonWidgetPrimary('Update',
                  () => null,
              100.0, 50.0)),
          ],
        ),
      ),
    ));
  }
}
