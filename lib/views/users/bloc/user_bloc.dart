import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/views/users/bloc/user_event.dart';
import 'package:key_admin_panel/views/users/bloc/user_state.dart';
import 'package:key_admin_panel/views/users/user_page_presenter.dart';

class UsersDataBloc extends Bloc<UsersDataEvent, UsersDataState> {
  UsersDataBloc() : super(InitialState()) {
    allUsersDataAPI();
  }

  Future<void> allUsersDataAPI() async{
    var result = await UserPagePresenter().allUsersAPI();
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
      AllUserModel allUserModel = AllUserModel.fromJson(parsed);
      if(allUserModel.result.isNotEmpty){
        emit(SuccessState(allUserModel.result));
      }else{
        emit(UserNotFoundState("Key not found."));
      }
    }else{
      emit(FailedState(parsed['message']));
      print("Failed : " + parsed['message']);
    }
     }
    }
