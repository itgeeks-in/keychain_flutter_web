import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/dialogs.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_bloc.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_state.dart';
import 'package:key_admin_panel/widgets/buttons.dart';

import '../../widgets/loader_widget.dart';
class CategoryPageUI extends StatefulWidget {
  const CategoryPageUI({super.key});

  @override
  State<CategoryPageUI> createState() => _CategoryPageUIState();
}

class _CategoryPageUIState extends State<CategoryPageUI> {
  @override
  void initState() {
    super.initState();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 8),
                  width: MediaQuery.of(context).size.width / 3,
                  height: 70,
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CustomTextField(
                      isPassVisible: false,
                      labelText: "Search",
                      prefixIconData: Icons.person_search_sharp,
                      hintText: "Search",
                    ),
                  ),
                ),
                ButtonWidget().buttonWidgetSimple('Add Category+', () => {
                Dialogs().addKeyCategory(context),
                }, 140.0, 40.0)
              ],
            ),
            const SizedBox(height: 20,),
            BlocProvider(
            create: (context) => CategoryPageBloc(),
              child: BlocBuilder<CategoryPageBloc,CategoryPageState>(
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
                                      Dialogs().deleteKeyCategory(context);
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
             ),
            )
           ],
         ),
       ),
     );
  }
}