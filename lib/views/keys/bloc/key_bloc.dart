import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/keys/bloc/key_state.dart';
import 'package:key_admin_panel/views/keys/keys_presenter.dart';

class KeyBloc extends Bloc<KeyEvent,KeyState>{
  KeyBloc():super(InitialKeysState()){
    getAllKeysAPI();
  }

  Future<void> getAllKeysAPI() async{
    emit(InitialKeysState());

    var result = await KeysPresenter().getAllKeyAPI();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+result.toString());
  }
}