import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/views/home/bloc/home_state.dart';
import 'package:key_admin_panel/views/home/home_page_presenter.dart';

import '../../../model/home_model.dart';

class HomeBloc extends Bloc<HomeBloc,HomeState> {
   HomeBloc() : super(InitialState()) {
     getDashboardDetailAPI();

   }
   Future<void> getDashboardDetailAPI() async {
      var result = await HomePagePresenter().getDashboardDetailAPI();
      Map<String, dynamic> parsed = jsonDecode(result.toString());
      if (parsed['status'])
      {
            HomeModel homeModel = HomeModel.fromJson(parsed);
            emit(SuccessState(homeModel.result.toString(),parsed['message']));

      } else {
         emit(FailedState(parsed['message']));
         print("Failed : " + parsed['message']);
      }
   }
}