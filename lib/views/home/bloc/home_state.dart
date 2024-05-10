import 'package:key_admin_panel/model/home_model.dart';

abstract class HomeState {}

class InitialState extends HomeState {}

class LoadState extends HomeState {}

class SuccessState extends HomeState {
  HomeData homeData;

  SuccessState(this.homeData);
}

class FailedState extends HomeState {
  String msg;

  FailedState(this.msg);
}
