import 'package:key_admin_panel/model/all_user_plan_model.dart';
import 'package:key_admin_panel/model/plan_model.dart';

class PlanState{}
class InitialState extends PlanState{}
class LoadState extends PlanState{}
class SuccessState extends PlanState {
 //List<PlanDetail> planDetail;
  List<UserDataPlan> userDataPlan;
  SuccessState(this.userDataPlan);
}

class DataNotFoundState extends PlanState {
 // List<PlanDetail> planDetail;
  String msg;
  DataNotFoundState(this.msg);
}

class FailedState extends PlanState {
  String msg;
  FailedState(this.msg);
}

