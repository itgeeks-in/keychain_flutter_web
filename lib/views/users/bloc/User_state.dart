import 'package:key_admin_panel/model/alluser_datamodel.dart';

abstract class UsersDataState {
  const UsersDataState();
}

class AllUsersDataInitialState extends UsersDataState {}

class AllUsersDataLoadingState extends UsersDataState {}

class UsersDataLoadSuccessfull extends UsersDataState {
  List<Result> data;
  UsersDataLoadSuccessfull(this.data);
}

// class UsersDataSuccessfull extends UsersDataState {
//   List<Result> dataa;
//   UsersDataSuccessfull(this.dataa);
// }

class UsersDataLoadFailedError extends UsersDataState {
  final String message;
  UsersDataLoadFailedError(this.message);
}
