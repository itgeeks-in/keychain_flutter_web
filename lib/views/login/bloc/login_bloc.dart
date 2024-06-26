import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/user_model.dart';
import 'package:key_admin_panel/utils/session.dart';
import 'package:key_admin_panel/utils/globals.dart' as globals;
import 'package:key_admin_panel/views/login/bloc/login_state.dart';
import 'package:key_admin_panel/views/login/bloc/login_event.dart';
import '../login_page_presenter.dart';

class  LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(LoginInitialState()){
    // todo : on click login button event
    on<OnButtonClick>((event, emit) async {
      emit(LoadState());
      if(event.email.isEmpty || event.email.trim().isEmpty){
        emit(EmailRequiredState());
      }else if(event.email != event.email.trim()){
        emit(EmailContainsSpace());
      }
      else {
        if(validateEmailStructure(event.email)){
          if(event.password.isEmpty || event.password.trim().isEmpty){
            emit(PassRequiredState());
          }else if(event.password != event.password.trim()){
            emit(PasswordContainsSpace());
          } else {
            if(event.password.length < 5){
              emit(PassInvalidState());
            } else {
              loginAPI(event.email, event.password);
            }
          }
        } else {
          print("Invalid email");
          emit(EmailInvalidState());
        }
      }
    });


    // todo : to change eyeIcon
    on<OnEyeIconClickEvent>((event, emit) {
      if(event.isVisible){
        emit(OnChangeIconState(false));
      }else{
        emit(OnChangeIconState(true));}
    });

  }
  
  bool validateEmailStructure(String value) {
    String pattern =
        '[a-z0-9]+@[a-z0-9]+.[a-z]{2,3}';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future<void> loginAPI(email,password) async {
   var result = await LoginPagePresenter().loginAPI(email, password);
   if(result.toString().contains("status")) {
     Session session = Session();
     Map<String, dynamic> parsed = jsonDecode(result.toString());
     if (parsed['status']) {
       UserDataModel userDataModel = UserDataModel.fromJson(parsed);
       if (userDataModel.result.isAdmin) {
         await session.setToken(userDataModel.result.token);
         session.setLoginUserData("$result");
         globals.token = userDataModel.result.token;
         emit(SuccessState());
       } else {
         emit(NonAdminState());
       }
     } else {
       emit(FailedState(parsed['message']));
       print("Failed : " + parsed['message']);
     }
   }else{
     emit(FailedState(result.toString()));
     print("Failed : " + result.toString());
   }
  }
}
