class AddCategoryEvent{

}

class OnButtonClickEvent extends AddCategoryEvent {
  String categoryName;
  OnButtonClickEvent(this.categoryName);
}
