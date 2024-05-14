import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/ShowSnackBar.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/dialogs.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_bloc.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_state.dart';
import 'package:key_admin_panel/widgets/buttons.dart';

import '../../widgets/loader_widget.dart';
class CategoryPageUI extends StatefulWidget {
  CategoryPageUI({super.key});

  @override
  State<CategoryPageUI> createState() => _CategoryPageUIState();
}

class _CategoryPageUIState extends State<CategoryPageUI> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }


  deleteAPICall(){
    Navigator.pop(context);
    ShowSnackBar().snackBarSuccessShow(context, "Working on delete");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorConsts.whiteColor,
         padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(

                  width: MediaQuery.of(context).size.width / 3,
                  height: 60,
                  child:  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: TextField(

                      controller: searchController,
                      style: TextStyle(color: ColorConsts.textColorDark),

                      decoration: InputDecoration(
                        labelText: "Search",
                        labelStyle: TextStyle(color: ColorConsts.primaryColor),
                        filled: true,
                        fillColor: ColorConsts.backgroundColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: ColorConsts.primaryColor,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: ColorConsts.primaryColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: ColorConsts.primaryColor, width: 2),
                        ),
                        prefixIcon: Icon(
                          Icons.person_search_sharp,
                          color: ColorConsts.primaryColor,
                        ),

                        hintText: "Search keys",
                        hintStyle: TextStyle(
                          color: ColorConsts.primaryColor,
                        ),
                      ),
                      onChanged: (value) {

                      },
                    )


                    ,
                  ),
                ),
                InkResponse(onTap: () {
                  context
                      .read<CategoryPageBloc>()
                      .filtered(searchController.text);
                },child: Container(width: 60,height: 55,
                    margin: EdgeInsets.fromLTRB(12, 3, 0, 0),
                    decoration: BoxDecoration(
                      color: ColorConsts.primaryColor,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 1,
                        color: ColorConsts.primaryColor,
                      ),),

                    child: Icon(Icons.search
                      ,size: 25,
                      color: ColorConsts.whiteColor,))),
                Spacer(),
                ButtonWidget().buttonWidgetSimple('Add Category+', () => {
                  Dialogs().addKeyCategory(context,() {

                  }),
                }, 140.0, 40.0)
              ],)



          , SizedBox(height: 20,),
            BlocBuilder<CategoryPageBloc,CategoryPageState>(
               builder: (context, state) {
               if(state is CategorySuccessState) {
                 return Expanded(
                     child: GridView.count(
                       crossAxisCount: 4,
                       crossAxisSpacing: 10,
                       mainAxisSpacing: 10,
                       childAspectRatio: (180 / 100),
                       children: List.generate(state.data.length, (index) {
                         return Container(
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             color: ColorConsts.whiteColor,
                             border: Border.all(
                               color: ColorConsts.secondaryColor,
                               width: 1.0,
                             ),
                             borderRadius: BorderRadius.circular(10.0),
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [Text(state.data[index].categoryName,
                                 style: ThemeText.textMediumSecondaryBold,
                               ),
                               const SizedBox(height: 10,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   InkResponse(
                                     onTap: () {
                                       Dialogs().editKeyCategory(context,state.data[index].categoryName);
                                     },
                                     child: Container(
                                       height: 32,
                                       width: 32,
                                       decoration: BoxDecoration(
                                           gradient: const LinearGradient(
                                             colors: [
                                               ColorConsts.primaryColor,
                                               ColorConsts.primaryColor,
                                             ],
                                             begin: Alignment.centerLeft,
                                             end: Alignment.centerRight,
                                           ),
                                           borderRadius:
                                           BorderRadius.circular(25.0)
                                           ,boxShadow: const [BoxShadow(
                                         color: ColorConsts.primaryColor,
                                         blurRadius: 1.0,
                                         offset: Offset(1, 2),
                                       ),]
                                       ),
                                       padding:
                                       const EdgeInsets.all(1.0),
                                       child: const Icon(
                                         Icons.edit_outlined,
                                         color: ColorConsts.whiteColor,size: 20,
                                       ),
                                     ),

                                   ),
                                   const SizedBox(height: 10,),
                                   InkResponse(
                                     onTap: () {
                                      Dialogs().deleteKeyCategory(context,() {
                                        deleteAPICall();
                                      },);
                                     },
                                     child: Container(
                                       height: 32,
                                       width: 32,
                                       decoration: BoxDecoration(
                                           gradient: const LinearGradient(
                                             colors: [
                                               ColorConsts.primaryColor,
                                               ColorConsts.primaryColor,
                                             ],
                                             begin: Alignment.centerLeft,
                                             end: Alignment.centerRight,
                                           ),
                                           borderRadius:
                                           BorderRadius.circular(25.0)

                                           ,boxShadow: const [BoxShadow(
                                         color: ColorConsts.primaryColor,
                                         blurRadius: 1.0,
                                         offset: Offset(1, 2),
                                       ),]
                                       ),
                                       padding:
                                       const EdgeInsets.all(1.0),
                                       child: const Icon(
                                         Icons.delete_forever,
                                         color: ColorConsts.whiteColor,size: 20,
                                       ),
                                     ),

                                   ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                       ),
                     )
                  );
                }else if(state is CategoryNotFoundState){
                 return Center(
                   child: Text(
                     state.msg,
                     style: ThemeText.textMediumSecondaryBold,
                    ),
                  );
                }else{
                 return Center(child: Loader().loaderWidget2());
               }
              },

            )
           ],
         ),
       ),
     );
  }
}