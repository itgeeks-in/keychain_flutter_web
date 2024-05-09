import 'dart:convert';
import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/keys_model.dart';
import 'package:key_admin_panel/views/keys/bloc/key_state.dart';
import 'package:key_admin_panel/views/keys/key_page_presenter.dart';

class KeyBloc extends Bloc<KeyEvent,KeyState>{
  KeyBloc():super(InitialState()){
    getAllKeysAPI();
  }

  Future<void> getAllKeysAPI() async{
    var result = await KeyPagePresenter().getAllKeyAPI("0",100);
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
    KeysModel keysModel = KeysModel.fromJson(parsed);
    if(keysModel.result.isNotEmpty){
      emit(SuccessState(keysModel.result));
    }else{
     emit(KeyNotFoundState("Key not found."));
    }
    }else{
      emit(FailedState(parsed['message']));
      print("Failed : " + parsed['message']);
    }
  }
}