class PlanEvent{

}

class OnScrollPageEvent extends PlanEvent {

  int index;
  int offset;
  OnScrollPageEvent(this.index,this.offset);
}
