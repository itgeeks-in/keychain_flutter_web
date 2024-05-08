import 'package:key_admin_panel/model/all_user_model.dart';

abstract class UsersDataState {

}

class InitialState extends UsersDataState {}

class LoadState extends UsersDataState {}

class SuccessState extends UsersDataState {
  List<UserData> data;

  SuccessState(this.data);
}

class FailedState extends UsersDataState {
  final String message;

  FailedState(this.message);
}
class UserNotFoundState extends UsersDataState {
  String msg;

  UserNotFoundState(this.msg);
}
