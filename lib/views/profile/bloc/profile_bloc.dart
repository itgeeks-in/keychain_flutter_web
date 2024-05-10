import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/profile/bloc/profile_event.dart';
import 'package:key_admin_panel/views/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileBloc():super(InitialState()){

  }
}