import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/login_screen/bloc/login_state.dart';
import 'package:key_admin_panel/views/login_screen/bloc/login_event.dart';
class  LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(LoginInitialState()){
    // todo : on click login button event
    on<OnButtonClick>((event, emit) async {
      emit(LoadState());
      if(event.email.isEmpty){
        emit(EmailRequiredState());
      } else {
        if(validateEmailStructure(event.email)){
          if(event.password.isEmpty){
            emit(PassRequiredState());
          } else {
            if(event.password.length < 4){
              emit(PassInvalidState());
            } else {
              emit(SuccessState());
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
}
