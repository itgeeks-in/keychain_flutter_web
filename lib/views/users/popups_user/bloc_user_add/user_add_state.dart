import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddUserState {}

class AddUserInitialState extends AddUserState {}

class AddUserLoadState extends AddUserState {}

class FirstNameRequiredState extends AddUserState {}

class LastNameRequiredState extends AddUserState {}

class EmailRequiredState extends AddUserState {}

class EmailInvalidState extends AddUserState {}

class ConfirmEmailRequiredState extends AddUserState {}

class EmailNotMatchState extends AddUserState {}

class PasswordRequiredState extends AddUserState {}

class PasswordInvalidState extends AddUserState {}

class ConfirmPasswordRequiredState extends AddUserState {}

class PasswordNotMatchState extends AddUserState {}

class IsAgreedRequiredState extends AddUserState {}

class AddUserSuccessState extends AddUserState {
  AddUserSuccessState();
}

class FailedState extends AddUserState {
  String message;
  FailedState(this.message);
}
