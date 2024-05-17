import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/views/users/bloc/user_event.dart';
import 'package:key_admin_panel/views/users/bloc/user_state.dart';
import 'package:key_admin_panel/views/users/user_page_presenter.dart';


class UsersDataBloc extends Bloc<UsersDataEvent, UsersDataState> {
  int limit = 9, offset = 0;
  int current_page = 1;
  bool LoadMore = true;
  List<UserData> data = [];
  String query="";

  UsersDataBloc() : super(InitialState()) {
    on<OnScrollPageEvent>((event, emit) {
      // TODO: implement event handler
      if (LoadMore) {
        current_page = event.index;
        // offset = event.offset;
        if (current_page == 1) {
          offset = 0;
        } else {
          offset = offset + limit;
        }
        getAllUserAPI();
      }
    });
    getAllUserAPI();
  }

  Future<void> getAllUserAPI() async{
    var result = await UserPagePresenter().getAllUserAPI(offset,limit,query);
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
      AllUserModel allUserModel = AllUserModel.fromJson(parsed);
      if(allUserModel.result.isEmpty){
        LoadMore = false;
        emit(SuccessState(current_page,data,LoadMore));
      }else{
        LoadMore = true;
        data.addAll(allUserModel.result);
        emit(SuccessState(current_page,  data, LoadMore));
      }
    }else{
      emit(FailedState(parsed['message']));
      print("Failed : " + parsed['message']);
    }
     }

  bool validateEmailStructure(String value) {
    String pattern =
        '[a-z0-9]+@[a-z0-9]+.[a-z]{2,3}';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }



  filtered(String query1) {
    emit(LoadState() );
    query = query1;
    offset = 0;
    current_page = 1;
    LoadMore = true;
    data.clear();
    print("object>>>>>>>>>>>>$query");
    getAllUserAPI();
  }

  refresh(){
    print("refresh");
    emit(RefreshChangeState());
  }
}
