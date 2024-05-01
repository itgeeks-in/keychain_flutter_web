// import 'dart:convert';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:key_admin_panel/model/alluser_datamodel.dart';
// import 'package:key_admin_panel/utils/session.dart';
// import 'package:key_admin_panel/views/users/bloc/User_event.dart';
// import 'package:key_admin_panel/views/users/bloc/User_state.dart';
// import 'package:key_admin_panel/views/users/user_page_presenter.dart';

// class UsersDataBloc extends Bloc<UsersDataEvent, UsersDataState> {
//   UsersDataBloc() : super(AllUsersDataInitialState()) {
//     // emit(AllUsersDataLoadingState());
//     allUsersAPI();
//   }

//   List<Result>? data = [];

//   // String? get accessToken => null;
//   Future<void> allUsersAPI() async {
//     Session session = Session();
//     String accessToken = session.getToken().toString();
//     print("access token is ${accessToken}");
//     print("print_____________________1");

//     var result = await UserPagePresenter().allUsersAPI();
//     print("print_____________________2");
//     print("print_____________________2 \n" + result.toString());
//     Map<String, dynamic> parsed = jsonDecode(result.toString());
//     print("print_____________________3");

//     if (parsed['status']) {
//       print("print_____________________3.1");
//       AllUserDataModel allUserDataModel = AllUserDataModel.fromJson(parsed);

//       print("print_____________________4");
//       // print("print_____________________            4   " +
//       //     allUserDataModel.message.toString());
//       // print("click here1");

//       // print("print_____________________4   " +
//       //     allUserDataModel.result!.length.toString());
//       print("click here");
//       data!.addAll(allUserDataModel.result!);
//       UsersDataLoadSuccessfull(data!);
//       print("print_____________________            5");

//       //

//       // await session.setToken(allUserDataModel.result.token);
//       // session.getLoginUserData("$result");

//       // await session.setToken(userDataModel.result.token);
//       // session.setLoginUserData("$result");

//       //  emit(UsersDataSuccessfull());
//     } else {
//       emit(UsersDataLoadFailedError(parsed['message']));
//     }
//   }
// }

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

// if (parsed['status']) {
//         AllUserDataModel allUserDataModel = AllUserDataModel.fromJson(parsed);
//         List<Result> resultList = allUserDataModel.result ?? [];
//         emit(UsersDataLoadSuccessfull(resultList));
//       } else {
//         emit(UsersDataLoadFailedError(parsed['message']));
//       }


// import 'dart:convert';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:key_admin_panel/model/alluser_datamodel.dart';
// import 'package:key_admin_panel/utils/session.dart';
// import 'package:key_admin_panel/views/users/bloc/User_event.dart';
// import 'package:key_admin_panel/views/users/bloc/User_state.dart';
// import 'package:key_admin_panel/views/users/user_page_presenter.dart';

// class UsersDataBloc extends Bloc<UsersDataEvent, UsersDataState> {
//   UsersDataBloc() : super(AllUsersDataInitialState()) {
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       emit(AllUsersDataLoadingState());

//       Session session = Session();
//       String accessToken = session.getToken().toString();
//       print("Access token is $accessToken");

//       var result2 = await UserPagePresenter().allUsersAPI();

//       Map<String, dynamic> parsed = jsonDecode(result2.toString());

//       if (parsed['status']) {
//         AllUserDataModel allUserDataModel = AllUserDataModel.fromJson(parsed);
//         List<Result> resultList = allUserDataModel.result ?? [];
//         emit(UsersDataLoadSuccessfull(resultList));
//       } else {
//         emit(UsersDataLoadFailedError(parsed['message']));
//       }
//     } catch (error) {
//       print("Error: $error");
//       emit(UsersDataLoadFailedError(error.toString()));
//     }
//   }
// }
