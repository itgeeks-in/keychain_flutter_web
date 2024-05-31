import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/model/all_user_plan_model.dart';
import 'package:key_admin_panel/model/plan_model.dart';
import 'package:key_admin_panel/views/plan/bloc/plan_event.dart';
import 'package:key_admin_panel/views/plan/bloc/plan_state.dart';
import 'package:key_admin_panel/views/plan/plan_page_presenter.dart';

class PlanBloc extends Bloc<PlanEvent,PlanState>{
//  List<PlanDetail> planDetail = [];
  int limit = 9, offset = 0;
  int current_page = 1;
  bool LoadMore = true;
  List<UserData> data = [];
  String query="";

  PlanBloc() : super(InitialState()) {
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
        getAllUserPlanDetail();
      }
    });
    getAllUserPlanDetail();
  }

  // Future<void> getAllUserPlanDetail() async{
  //
  //   var result = await PlanPagePresenter().getAllUserPlanDetail();
  //   Map<String,dynamic> parsed = jsonDecode(result.toString());
  //   print("+++++333333333333++++++++++"+parsed['result'].toString());
  //   if(parsed['status']){
  //     AllUserModel allUserModel = AllUserModel.fromJson(parsed);
  //     if(allUserModel.result.isNotEmpty){
  //       emit(SuccessState(allUserModel.result,,));
  //     }else if(allUserModel.result.isEmpty){
  //       emit(DataNotFoundState(allUserModel.message));
  //     }
  //   }else{
  //     emit(FailedState(parsed['message']));
  //     print("Failed : " + parsed['message']);
  //   }
  // }

  Future<void> getAllUserPlanDetail() async{
    var result = await PlanPagePresenter().getAllUserPlanDetail(offset,limit,query);
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
      AllUserModel allUserModel = AllUserModel.fromJson(parsed);
      if(allUserModel.result.isEmpty){
        LoadMore = false;
        emit(SuccessState(data,current_page,LoadMore));
      }else{
        LoadMore = true;
        data.addAll(allUserModel.result);
        emit(SuccessState(data,current_page, LoadMore));
      }
    }else{
      emit(FailedState(parsed['message']));
      print("Failed : " + parsed['message']);
    }
  }
  filtered(String query1) {
    emit(LoadState() );
    query = query1;
    offset = 0;
    current_page = 1;
    LoadMore = true;
    data.clear();
    print("object>>>>>>>>>>>>$query");
    getAllUserPlanDetail();
  }

  refresh(){
    print("refresh");
    emit(RefreshChangeState());
  }
}


