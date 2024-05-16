import 'package:key_admin_panel/model/category_model.dart';

class CategoryPageState{

}
class CategoryInitialState extends CategoryPageState{

}
class CategoryLoadState extends CategoryPageState{

}
class CategorySuccessState extends CategoryPageState{
  List<CategoryData>data;
  CategorySuccessState(this.data);

}

class RefreshChangeState extends CategoryPageState{

}
class CategoryNotFoundState extends CategoryPageState{
  String msg;
  CategoryNotFoundState(this.msg);
}
class CategoryFailedState extends CategoryPageState{
  String msg;
  CategoryFailedState(this.msg);

}