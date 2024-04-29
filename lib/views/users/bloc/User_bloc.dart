import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/alluser_datamodel.dart';
import 'package:key_admin_panel/utils/session.dart';
import 'package:key_admin_panel/views/users/bloc/User_event.dart';
import 'package:key_admin_panel/views/users/bloc/User_state.dart';
import 'package:key_admin_panel/views/users/user_page_presenter.dart';

class UsersDataBloc extends Bloc<UsersDataEvent, UsersDataState> {
  UsersDataBloc() : super(AllUsersDataInitialState()) {
    // emit(AllUsersDataLoadingState());
    allUsersAPI();
  }

  List<Result>? data=[];

  // String? get accessToken => null;
  Future<void> allUsersAPI() async {
    Session session = Session();
    String accessToken = session.getToken().toString();
    print("access token is ${accessToken}");
    print("print_____________________1");

    var result = await UserPagePresenter().allUsersAPI(accessToken);
    print("print_____________________2");
    print("print_____________________2 \n"+result.toString());
    Map<String, dynamic> parsed = jsonDecode(result.toString());
    print("print_____________________3");

    if (parsed['status']) {
      print("print_____________________3.1");
      AllUserDataModel allUserDataModel
      = AllUserDataModel.fromJson(parsed);

      print("print_____________________            4");
      print("print_____________________            4   "+allUserDataModel.message.toString());
      print("print_____________________            4   "+allUserDataModel.result!.length.toString());
      data!.addAll(allUserDataModel.result!);
      UsersDataLoadSuccessfull(data!);
     //

      // await session.setToken(allUserDataModel.result.token);
      // session.getLoginUserData("$result");

      // await session.setToken(userDataModel.result.token);
      // session.setLoginUserData("$result");

    //  emit(UsersDataSuccessfull());
    } else {
      emit(UsersDataLoadFailedError(parsed['message']));
    }
  }
}



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

//   List<Result>? data;

//   // String? get accessToken => null;
//   Future<void> allUsersAPI() async {
//     Session session = Session();
//     String accessToken = session.getToken().toString();
//     print("access token is ${accessToken}");
//     print("print_____________________1");
//     Map<String, dynamic> parsed = jsonDecode(toString());
//     if (parsed['status']) {
//       var result = await UserPagePresenter().allUsersAPI(accessToken);
//       print("print_____________________2");

//       AllUserDataModel allUserDataModel =
//           AllUserDataModel.fromJson(parsed['result']);
//       print("result is-----------agsfdaghsfd->>>>>>>>>");
//       data!.addAll(allUserDataModel.result!);
//       print("result is------------>>>>>>>>>${data!.first.firstName}");
//       // await session.setToken(allUserDataModel.result.token);
//       // session.getLoginUserData("$result");

//       // await session.setToken(a.result.token);
//       session.getLoginUserData("$result");

//       // emit(UsersDataSuccessfull());
//     } else {
//       emit(UsersDataLoadFailedError(parsed['message']));
//     }
//   }
// }
