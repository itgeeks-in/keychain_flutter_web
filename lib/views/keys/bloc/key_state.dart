import 'package:key_admin_panel/model/keys_model.dart';

class KeyState {}

class InitialState extends KeyState {}




class LoadState extends KeyState {}

class SuccessState extends KeyState {
  List<KeysData> data;
  int current_page;

  bool LoadMore;
  SuccessState(this.current_page,this.data, this.LoadMore);
}

class KeyNotFoundState extends KeyState {
  String msg;

  KeyNotFoundState(this.msg);
}

class FailedState extends KeyState {
  String msg;

  FailedState(this.msg);
}
