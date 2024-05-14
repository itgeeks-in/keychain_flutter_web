import '../../../model/plan_model.dart';

class PlanListState{}

class PlanInitialState extends PlanListState{}

class PlanSuccessState extends PlanListState{
  List<PlanDetail> planDetail;
  PlanSuccessState(this.planDetail);
}
class PlanNotFoundState extends PlanListState{
  String msg;
  PlanNotFoundState(this.msg);
}
class PlanFailedState extends PlanListState{
  String msg;
  PlanFailedState(this.msg);
}
