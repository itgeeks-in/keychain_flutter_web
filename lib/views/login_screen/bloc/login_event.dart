class LoginEvent {

}
class OnButtonClick extends LoginEvent {
  final String email;
  final String password;
  OnButtonClick(this.email, this.password);
}

class OnEyeIconClickEvent extends LoginEvent {
  bool isVisible;
  OnEyeIconClickEvent(this.isVisible);
}
