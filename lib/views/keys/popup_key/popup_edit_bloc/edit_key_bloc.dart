import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/keys/popup_key/popup_edit_bloc/edit_key_event.dart';
import 'package:key_admin_panel/views/keys/popup_key/popup_edit_bloc/edit_key_state.dart';

class EditKeyBloc extends Bloc<EditKeyEvent,EditKeyState>{
  EditKeyBloc() : super(EditKeyInitialState()){
    on<OnUpdateButtonClick>((event, emit) async {
      emit(EditKeyLoadState());
      if(event.keyName.isEmpty){
        emit(KeyNameRequiredState());
      }
  });
}
}