import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/Cubit/States.dart';
import 'package:newsapplication/Modules/Business/Business_Screen.dart';
import 'package:newsapplication/Modules/Science/Science_Screen.dart';
import 'package:newsapplication/Modules/Settings/Setting_Screen.dart';
import 'package:newsapplication/Modules/Sports/Sports_Screen.dart';
import 'package:newsapplication/Network/Dio_Helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens=[
    businessScreen(),
    scienceScreen(),
    sportsScreen(),
    settingScreen()
  ];
  List<BottomNavigationBarItem> bottonNavigate=[
    BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label: 'Business',
  ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.sports),
  label: 'Sports',
),
    BottomNavigationBarItem(
    icon: Icon(Icons.settings),
  label: 'Settings',
),
  ];
  void toggleBetweenScreen(int index)
  {
    currentIndex=index;
    if(index==1)
      getScience();
    else if(index==2)
      getSports();
    emit(NewsBottomNavState());
  }
  List <dynamic> business=[];
  void getBusiness()
  {
    emit(NewsGetBusniessLoadingState());

    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '5f9a68dc8d074de6836eeec9270d819a'
        }
        ).then((value) {
      //print(value.data['articles'][0]['title']);
      business= value.data['articles'];
      print(business.length);
      emit(NewsGetBusniessSuccessState());
    } ).catchError((error) {
      print(error.toString());
      emit(NewsGetBusniessErrorState(error.toString()));
    }
    );
  }
  List <dynamic> sports=[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0)
      {
        DioHelper.getData(
          url: "v2/top-headlines",
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '5f9a68dc8d074de6836eeec9270d819a'
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports= value.data['articles'];
        print(sports.length);
        emit(NewsGetSportsSuccessState());
      } ).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      }
      );

      }
    else
      {
        emit(NewsGetSportsSuccessState());

      }

  }
  List <dynamic> science=[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.length==0)
      {
        DioHelper.getData(
            url: "v2/top-headlines",
            query: {
              'country': 'eg',
              'category': 'science',
              'apiKey': '5f9a68dc8d074de6836eeec9270d819a'
            }
        ).then((value) {
          //print(value.data['articles'][0]['title']);
          science= value.data['articles'];
          print(science.length);
          emit(NewsGetScienceSuccessState());
        } ).catchError((error) {
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        }
        );
      }
    else
      {
        emit(NewsGetScienceSuccessState());

      }
      }


}