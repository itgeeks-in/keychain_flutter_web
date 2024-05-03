import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/route/route_generate.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_bloc.dart';
import 'package:key_admin_panel/views/category/bloc/category_page_state.dart';
import 'package:key_admin_panel/views/category/popup_category/popup_add_category.dart';
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
                        hintStyle: const TextStyle(color: Colors.grey)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context) => PopupAddCategory(),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                    shadowColor: ColorConsts.primaryColor,
                    elevation: 10,
                    backgroundColor: ColorConsts.primaryColor,
                  ),
                  child: const Text(
                    'Add Category',
                    style:ThemeText.textSmallWhiteBold,
                  ),
                ),
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