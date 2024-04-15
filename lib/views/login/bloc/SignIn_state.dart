abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInInvalidState extends SignInState {}

class SignInValidState extends SignInState {
  // SignInSuccessState();
}

class SignInLoadingState extends SignInState {}

class EmailRequiredState extends SignInState {}

class EmailInvalidState extends SignInState {}

class PassRequiredState extends SignInState {}

class PassInvalidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}

class OnChangeIconState extends SignInState {
  bool isVisible;
  OnChangeIconState(this.isVisible);
}
