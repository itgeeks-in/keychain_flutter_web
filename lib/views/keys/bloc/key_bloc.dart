import 'dart:convert';
import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/model/keys_model.dart';
import 'package:key_admin_panel/utils/session.dart';
import 'package:key_admin_panel/views/keys/bloc/key_state.dart';
import 'package:key_admin_panel/views/keys/key_page_presenter.dart';

class KeyBloc extends Bloc<KeyEvent,KeyState>{
  KeyBloc():super(InitialState()){
    getAllKeysAPI();
  }

  Future<void> getAllKeysAPI() async{
    emit(LoadState());
    var result = await KeyPagePresenter().getAllKeyAPI();
    Session session = Session();
    Map<String,dynamic> parsed = jsonDecode(result.toString());
    if(parsed['status']){
    KeysModel keysModel = KeysModel.fromJson(parsed);
     emit(SuccessState(keysModel.result));
    }else{
      emit(FailedState(parsed['message']));
    }
  }
}