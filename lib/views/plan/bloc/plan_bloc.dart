import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/all_user_model.dart';
import 'package:key_admin_panel/model/all_user_plan_model.dart';
import 'package:key_admin_panel/views/plan/bloc/plan_event.dart';
import 'package:key_admin_panel/views/plan/bloc/plan_state.dart';
import 'package:key_admin_panel/views/plan/plan_page_presenter.dart';

class PlanBloc extends Bloc<PlanEvent,PlanState>{
  List<UserDataPlan> data = [];
  PlanBloc():super(InitialState()){
    getAllUserPlanDetail();
  }

  Future<void> getAllUserPlanDetail() async{

    var result = await PlanPagePresener().getAllUserPlanDetail();
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
      AllUserPlanModel allUserPlanModel = AllUserPlanModel.fromJson(parsed);
      if(allUserPlanModel.result.isNotEmpty){
        emit(SuccessState(allUserPlanModel.result));
      }else if(allUserPlanModel.result.isEmpty){
        emit(DataNotFoundState(allUserPlanModel.message));
      }
    }else{
      emit(FailedState(parsed['message']));
      print("Failed : " + parsed['message']);
    }
  }
}


