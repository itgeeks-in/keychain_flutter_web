import 'package:key_admin_panel/model/home_model.dart';

abstract class HomeState {}
class InitialState extends HomeState{}
class LoadState extends HomeState{}
class SuccessState extends HomeState{
  HomeModel homeModel;
  String msg;
  SuccessState(this.msg,this.homeModel);
}
class FailedState extends HomeState{
  String msg;
  FailedState(this.msg);
}