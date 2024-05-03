import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/category/popup_category/bloc/add_category_event.dart';
import 'package:key_admin_panel/views/category/popup_category/bloc/add_category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent,AddCategoryState>{
  AddCategoryBloc(): super(InitialState()){

  }

}