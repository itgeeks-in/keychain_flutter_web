import 'dart:convert';
import 'dart:html';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/keys_model.dart';
import 'package:key_admin_panel/views/keys/bloc/key_state.dart';
import 'package:key_admin_panel/views/keys/key_page_presenter.dart';

import 'key_event.dart';

class KeyBloc extends Bloc<KeyEvent,KeyState>{
  int limit = 5, offset = 0;
  int current_page = 1;
  List<KeysData> data = [];
  bool LoadMore = true;
  String query="";

  KeyBloc():super(InitialState()){

    on<OnScrollPageEvent>((event, emit) {
      // TODO: implement event handler
      if (LoadMore) {
        current_page = event.index;
        // offset = event.offset;
        if (current_page == 1) {
          offset = 0;
        } else {
          offset = offset + limit;
        }
        getAllKeysAPI();
      }
    });
    getAllKeysAPI();
  }

  Future<void> getAllKeysAPI() async{

    var result = await KeyPagePresenter().getAllKeyAPI(offset.toString(),limit,query);
  //  print("object======================= $result");
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
    KeysModel keysModel = KeysModel.fromJson(parsed);
    if(keysModel.result.isEmpty){
        LoadMore = false;
      emit(SuccessState(current_page,  data, LoadMore));
    }else{
      LoadMore = true;

      data.addAll(keysModel.result);
      emit(SuccessState(current_page,  data, LoadMore));
    }
    }else{
      emit(FailedState(parsed['message']));
    }
  }


  filtered(String query1) {
    emit(LoadState() );
    query = query1;
    offset = 0;
    current_page = 1;
    LoadMore = true;
    data.clear();
    print("object>>>>>>>>>>>>$query");
    getAllKeysAPI();
  }

}


