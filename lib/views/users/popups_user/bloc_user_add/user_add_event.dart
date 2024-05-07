class AddUserEvent {}

class OnAddUserButtonClick extends AddUserEvent {
  String firstName;
  String lastName;
  String email;
  String confirmEmail;
  String password;
  String confirmPassword;
  bool isAgreed;

  OnAddUserButtonClick(
    this.firstName,
    this.lastName,
    this.email,
    this.confirmEmail,
    this.password,
    this.confirmPassword,
    this.isAgreed,
  );
}