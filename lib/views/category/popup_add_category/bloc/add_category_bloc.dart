import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/category/category_page_presenter.dart';
import 'package:key_admin_panel/views/category/popup_add_category/bloc/add_category_event.dart';
import 'package:key_admin_panel/views/category/popup_add_category/bloc/add_category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent,AddCategoryState>{
  AddCategoryBloc(): super(InitialState()){

  on<OnButtonClickEvent>((event, emit) async {
    emit(LoadingAddCategoryState());
    if (event.categoryName.isEmpty) {
      emit(CategoryRequiredState());
    }
    if(event.categoryName.isNotEmpty){
      emit(SuccessAddCategoryState());
      CategoryPagePresenter().addKeyCategory(event.categoryName);
    }
  });
 }
}