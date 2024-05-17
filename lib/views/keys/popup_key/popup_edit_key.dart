import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_admin_panel/model/category_model.dart';
import 'package:key_admin_panel/model/keys_model.dart';
import 'package:key_admin_panel/utils/custom_image_picker.dart';
import 'package:key_admin_panel/utils/custom_text_field.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_bloc.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_state.dart';
import 'package:key_admin_panel/views/keys/key_page_presenter.dart';
import 'package:key_admin_panel/widgets/buttons.dart';
import '../../../utils/loading_dialog.dart';

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
   String error="";
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


apiCall() async {
  LoadingDialog.show(context);
  var res =    await  KeyPagePresenter().keyEditAPI(_keyNameController.text,
      _descriptionNameController.text, categoryIdSelect, widget.keysData.id);

  LoadingDialog.hide(context);
  if(res.toString().contains("status")){

    Map<String,dynamic> parsed = json.decode(res.toString());
    if (parsed['status']) {
      error="Updated successfully.";
      Navigator.pop(context);
    }else{
      error="Not updated.";
    }
  }else{
    error="Not updated";
  }
  setState(() {

  },);
}


  @override
  Widget build(BuildContext context) {
    double sizeW=MediaQuery.of(context).size.width/2.5;
    double sizeH=MediaQuery.of(context).size.height/1.5;
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
              padding: const EdgeInsets.fromLTRB(10, 12, 16, 0),
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
              padding: EdgeInsets.only(left: 40, right: 40, top: 30),
              child: Center(
                  child: CustomTextField(
                controller: _keyNameController,
                isPassVisible: false,
                labelText: "Key name",
                prefixIconData: Icons.vpn_key_outlined,
                hintText: "Enter key name",
                    maxline: 1,
              )),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: CustomTextField(
                prefixIconData: Icons.description_outlined,
                isPassVisible: false,
                controller: _descriptionNameController,
                labelText: "Description",
                hintText: "Enter description",
                maxline: 1,
              ),
            ),
            Container(
                height: 55,
                width: sizeW,
                margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
                padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
                decoration: new BoxDecoration(
                    border: Border.all(
                        color: ColorConsts.primaryColor,
                        width: 1.0),
                    color: ColorConsts.whiteColor,
                    borderRadius: BorderRadius.circular(11.0),

                ),
                child:Row(children: [
                  Icon(Icons.category_outlined,color: ColorConsts.primaryColor,size: 20)
                  ,SizedBox(width: 7,),

                  BlocProvider(
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
                   /* if(context.read<CategoryPageBloc>().selectOptionCategory == null){
                      context.read<CategoryPageBloc>().selectOptionCategory=categoryList[0];
                    }*/
                  }
                  return SizedBox(width: sizeW/1.5,
                      child:  DropdownButton<CategoryData>(
                    dropdownColor: ColorConsts.whiteColor,
                    icon: Icon(Icons.arrow_drop_down,color: ColorConsts.primaryColor,size: 30),
                    iconSize: 30,
                    underline: const SizedBox(),
                    value: context.read<CategoryPageBloc>().selectOptionCategory,

                    items: categoryList.map((CategoryData item) {
                      if(item.categoryId == categoryIdSelect){

                        if(context.read<CategoryPageBloc>().selectOptionCategory == null){
                          context.read<CategoryPageBloc>().selectOptionCategory=item;
                         // print("Initial >>>>>>>>>>>>>>>>>>>>> "+context.read<CategoryPageBloc>().selectOptionCategory!.category.toString());

                          context.read<CategoryPageBloc>().refresh();}
                      }
                      return DropdownMenuItem<CategoryData>(
                        value: item,
                        child: Text(
                          item.categoryName,
                          style: (item.categoryId == widget.keysData.categoryId)?ThemeText.textMediumSecondaryBold:
                          ThemeText.textSmallGrey,
                        ),
                      );
                    }).toList(),
                    onChanged: (CategoryData? newValue) {
                      context.read<CategoryPageBloc>().selectOptionCategory = newValue;
                      categoryIdSelect=context.read<CategoryPageBloc>().selectOptionCategory!.categoryId;
                      setState(() {
                      });
                    },
                  )
                  );
                },),
              )],)
            ),
            SizedBox(height: 5,),
          /*  Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.network(
                      widget.keysData.imagePath,
                      height: 105,
                      width: sizeW/3.6,
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
                      height: 105,
                      width: sizeW/3.6,
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
                      height: 105,
                      width: sizeW/3.6,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 2),
                    Text("Lock Image" , style: ThemeText.textMediumSecondary,),
                  ],
                ),
              ],
            ),
          ),*/
          SizedBox(height: 6,),

          Center(child: ButtonWidget().buttonWidgetSimple('Update',
               () {
            if(_descriptionNameController.text.isNotEmpty && _keyNameController.text.isNotEmpty) {
              apiCall();
            }else{
              error = "Required all fields";
              setState(() {

              });
            }
               },
              100.0, 40.0)),
            Center(child: Text(error,style: TextStyle(color: ColorConsts.redColor))),

          ],
        ),
      ),
    ));
  }
}
