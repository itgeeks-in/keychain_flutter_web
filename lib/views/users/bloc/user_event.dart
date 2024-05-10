
 class UsersDataEvent {}

class OnScrollPageEvent extends UsersDataEvent {

  int index;
  int offset;
  OnScrollPageEvent(this.index,this.offset);
}
