import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/category_model.dart';
import 'package:key_admin_panel/views/category/category_page_presenter.dart';
import 'category_page_state.dart';
import 'category_page_event.dart';
class CategoryPageBloc extends Bloc<CategoryPageEvent,CategoryPageState> {
  CategoryData? selectOptionCategory ;
  List<CategoryData> resultCategoryList=[];
  CategoryPageBloc() :super(CategoryInitialState()) {
    getAllCategory("");
  }

  Future<void> getAllCategory(query1) async {
    var result = await CategoryPagePresenter().getAllCategoryAPI(query1);
    Map<String, dynamic> parsed = jsonDecode(result.toString());
    if (result.toString().contains("status")) {
      Map<String, dynamic> parsed = jsonDecode(result.toString());
      if (parsed['status']) {
        CategoryModel categoryModel = CategoryModel.fromJson(parsed);
        if (categoryModel.result.isNotEmpty) {
          emit(CategorySuccessState(categoryModel.result));
        } else {
          emit(CategoryNotFoundState(categoryModel.message));
        }
      } else {
        emit(CategoryFailedState(parsed['message']));
        print("Failed :"+ parsed['message']);
      }
    } else {
      emit(CategoryFailedState(result.toString()));
      print("Failed : "+result.toString());
    }
  }



  filtered(String query1) {
    emit(CategoryLoadState() );


    getAllCategory(query1);
  }
}
