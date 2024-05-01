import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/alluser_datamodel.dart';
import 'package:key_admin_panel/utils/session.dart';
import 'package:key_admin_panel/views/users/bloc/User_event.dart';
import 'package:key_admin_panel/views/users/bloc/User_state.dart';
import 'package:key_admin_panel/views/users/user_page_presenter.dart';

class UsersDataBloc extends Bloc<UsersDataEvent, UsersDataState> {
  UsersDataBloc() : super(AllUsersDataInitialState()) {
    allUsersDataAPI();
  }

  List<Result> data = [];

  Future<void> allUsersDataAPI() async {
    try {
      Session session = Session();
      String accessToken = session.getToken().toString();

      List<dynamic> dataFromAPi = await UserPagePresenter().allUsersAPI();

      //Map<String, dynamic> parsed = jsonDecode(dataFromAPi.toString());

      //  UserDataModel userDataModel = UserDataModel.fromJson(parsed);

      // List<Result> ll = [];
      dataFromAPi.forEach((element) {
        data.add(Result.fromJson(element));
      });

      print("--------------<><><><>---------");
      print(data);
      print("-------------<><><><><>----------");
      // print("---------------------------------");
      // print("print_____________________1+${allUserData}");
      // print("---------------------------------");

      // allUserData.forEach((userData) {
      //   print("---------------------------------");
      //   print("print_____________________2+${allUserData[2]}");
      //   print("---------------------------------");

      if (data.isNotEmpty) {
        // data.addAll(userData.result!);
        emit(UsersDataLoadSuccessfull(data));

        print("print_____________________2.2");
        // print(data.length);
      }
      // print("print_____________________3");

      // );
    } catch (error) {
      emit(UsersDataLoadFailedError(error.toString()));
    }
  }
}
