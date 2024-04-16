// ignore_for_file: file_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/login/bloc/SignIn_state.dart';
import 'package:key_admin_panel/views/login/bloc/signIn_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {});
    on<SignInSubmittedEvent>((event, emit) {
      // emit(SignInLoadingState());
      if (
          // event.emailValue == "" &&
          EmailValidator.validate(event.email) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.password.length < 3) {
        emit(SignInErrorState("Please enter a valid password"));
      } else {
        emit(SignInValidState());
      }
    });
  }
}
