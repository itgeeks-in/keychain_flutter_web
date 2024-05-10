import 'package:key_admin_panel/model/all_user_model.dart';

abstract class UsersDataState {

}

class InitialState extends UsersDataState {}

class LoadState extends UsersDataState {}

class SuccessState extends UsersDataState {
  List<UserData> data;
  int current_page;

  bool LoadMore;

  SuccessState(this.current_page,this.data,this.LoadMore);
}

class FailedState extends UsersDataState {
  final String message;

  FailedState(this.message);
}
class UserNotFoundState extends UsersDataState {
  String msg;

  UserNotFoundState(this.msg);
}
