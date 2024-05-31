
import '../../../model/all_user_model.dart';

class PlanState{}
class InitialState extends PlanState{}
class LoadState extends PlanState{}
class RefreshChangeState extends PlanState{
}
class SuccessState extends PlanState {
  List<UserData> data;
  int current_page;

  bool LoadMore;
  SuccessState(this.data,this.current_page,this.LoadMore);
}

class DataNotFoundState extends PlanState {
  String msg;
  DataNotFoundState(this.msg);
}

class FailedState extends PlanState {
  String msg;
  FailedState(this.msg);
}

