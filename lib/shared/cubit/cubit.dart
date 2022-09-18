import 'package:bloc/bloc.dart';
import 'package:china/modules/business.dart';
import 'package:china/modules/science.dart';
import 'package:china/modules/settings.dart';
import 'package:china/modules/sports.dart';
import 'package:china/network/remote/dio_helper.dart';
import 'package:china/shared/cubit/states.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(IntialState());
  int counter = 0;
  List<String> titles = [
    'Business',
    'Sports',
    'Science',
    'Settings',
  ];
  List<Widget> screens = [
    business(),
    sports(),
    science(),
    Settings(),
  ];
  static AppCubit get(context) => BlocProvider.of(context);
  void change(value) {
    if (value == 1) {
      getSports();
    }
    if (value == 2) {
      getScience();
    }
    counter = value;
    emit(ChangeBottomNav());
  }

  List<TabItem> items = [
    TabItem(
      icon: Icon(Icons.business),
      title: 'Business',
    ),
    TabItem(
      icon: Icon(Icons.sports),
      title: 'sports',
    ),
    TabItem(
      icon: Icon(Icons.science),
      title: 'science',
    ),
    TabItem(
      icon: Icon(Icons.settings),
      title: 'Setting',
    ),
  ];

  List<dynamic> busines = [];
  void getBusiness() {
    emit(NewsLoadingData());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'a55b4497aa5a4dd9959cd9d983a5c9b1',
      'fbclid': 'IwAR2EigBaIVCk8_6Ci4lLi5zzCknW0epESDCmbDpi_fwrod71EB6CIOpPtF8'
    }).then((value) {
      busines = value.data['articles'];

      emit(NewsGetBusinessSucessData());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorData(error.toString()));
    });
  }

  List<dynamic> Sports = [];
  void getSports() {
    emit(NewsSportsLoadingData());
    if (Sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'a55b4497aa5a4dd9959cd9d983a5c9b1',
        'fbclid':
            'IwAR2EigBaIVCk8_6Ci4lLi5zzCknW0epESDCmbDpi_fwrod71EB6CIOpPtF8'
      }).then((value) {
        Sports = value.data['articles'];

        emit(NewsGetSportsSucessData());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorData(error.toString()));
      });
    } else
      emit(NewsGetSportsSucessData());
  }

  List<dynamic> Science = [];
  void getScience() {
    emit(NewsScienceLoadingData());
    if (Science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'a55b4497aa5a4dd9959cd9d983a5c9b1',
        'fbclid':
            'IwAR2EigBaIVCk8_6Ci4lLi5zzCknW0epESDCmbDpi_fwrod71EB6CIOpPtF8'
      }).then((value) {
        Science = value.data['articles'];

        emit(NewsGetScienceSucessData());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSceinceErrorData(error.toString()));
      });
    } else
      emit(NewsGetScienceSucessData());
  }
}
