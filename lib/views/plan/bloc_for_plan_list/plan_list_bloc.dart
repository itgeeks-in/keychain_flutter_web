import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/plan/bloc_for_plan_list/plan_list_event.dart';
import 'package:key_admin_panel/views/plan/bloc_for_plan_list/plan_list_state.dart';

import '../../../model/plan_model.dart';
import '../plan_page_presenter.dart';

class PlanListBloc extends Bloc<PlanListEvent,PlanListState>{
  List<PlanDetail> planDetail = [];
  PlanListBloc():super(PlanInitialState()){
    getAllPlan();
  }

  Future<void> getAllPlan() async{
    var result = await PlanPagePresenter().getAllPlan();
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
      PlanModel planModel = PlanModel.fromJson(parsed);
      planDetail.clear();
      planDetail.addAll(planModel.result);
      if(planModel.result.isNotEmpty){
        emit(PlanSuccessState(planDetail));
      }else if(planModel.result.isEmpty){
        emit(PlanNotFoundState(planModel.message));
      }else{
        emit(PlanFailedState(planModel.message));
      }
    }else{
      emit(PlanFailedState(parsed['message']));
      print("Failed :"+ parsed['message']);
    }
  }

  filtered() {
    emit(PlanLoadSate());
    getAllPlan();
  }
}