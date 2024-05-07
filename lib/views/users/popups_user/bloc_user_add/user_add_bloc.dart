import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/user_model.dart';
import 'package:key_admin_panel/utils/session.dart';
import 'package:key_admin_panel/views/users/popups_user/bloc_user_add/user_add_event.dart';
import 'package:key_admin_panel/views/users/popups_user/bloc_user_add/user_add_state.dart';
import 'package:key_admin_panel/views/users/popups_user/user_add_presenter.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  AddUserBloc() : super(AddUserInitialState()) {
    on<OnAddUserButtonClick>((event, emit) async {
      emit(AddUserLoadState());
      if (event.firstName.isEmpty) {
        emit(FirstNameRequiredState());
      } else if (event.lastName.isEmpty) {
        emit(LastNameRequiredState());
      } else if (event.email.isEmpty) {
        emit(EmailRequiredState());
      } else if (!validateEmailStructure(event.email)) {
        emit(EmailInvalidState());
      } else if (event.confirmEmail.isEmpty) {
        emit(ConfirmEmailRequiredState());
      } else if (event.confirmEmail != event.email) {
        emit(EmailNotMatchState());
      } else if (event.password.isEmpty) {
        emit(PasswordRequiredState());
      } else if (event.password.length < 5) {
        emit(PasswordInvalidState());
      } else if (event.confirmPassword.isEmpty) {
        emit(ConfirmPasswordRequiredState());
      } else if (event.confirmPassword != event.password) {
        emit(PasswordNotMatchState());
      } else if (event.isAgreed != true) {
        emit(IsAgreedRequiredState());
      } else {
        AddUserAPI(
            event.firstName,
            event.lastName,
            event.email,
            event.confirmEmail,
            event.password,
            event.confirmPassword,
            event.isAgreed);
      }
    });
  }

  bool validateEmailStructure(String value) {
    String pattern = '[a-z0-9]+@[a-z0-9]+.[a-z]{2,3}';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future<void> AddUserAPI(firstName, lastName, email, confirmEmail, password,
      confirmPassword, isAgreed) async {
    var result = await UserAddPresenter().signupAPI(firstName, lastName, email,
        confirmEmail, password, confirmPassword, isAgreed);
    print("???????????   " + result.toString());

    if (result.toString().contains("status")) {
     // Session session = Session();
      Map<String, dynamic> parsed = json.decode(result.toString());
      if (parsed['status']) {
        UserDataModel userDataModel = UserDataModel.fromJson(parsed);
        //await session.setToken(userDataModel.result.token);
       // session.setLoginUserData("$result");
        emit(AddUserSuccessState());
      } else {
        emit(FailedState(parsed['message']));
      }
    } else {
      emit(FailedState(result.toString()));
    }
  }
}
