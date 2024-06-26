abstract class LoginState {

}
class LoginInitialState extends LoginState {}

class LoadState extends LoginState {}

class EmailRequiredState extends LoginState {}

class EmailContainsSpace extends LoginState {}

class EmailInvalidState extends LoginState {}

class PassRequiredState extends LoginState {}

class PasswordContainsSpace extends LoginState {}

class PassInvalidState extends LoginState {}

class SuccessState extends LoginState{
  SuccessState();
}

class FailedState extends LoginState {
  final String message;
  FailedState(this.message);
}

class NonAdminState extends LoginState{

}
class NoUserWithEmailState extends LoginState{
  final String messgage;
  NoUserWithEmailState(this.messgage);
}
class OnChangeIconState extends LoginState {
  bool isVisible;
  OnChangeIconState(this.isVisible);
}
