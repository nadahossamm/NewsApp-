import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapplication/HomeLayout/HomeScreen.dart';
import 'package:newsapplication/Network/Dio_Helper.dart';
void main() {
  Bloc.observer=BlocObserver();
  DioHelper.int();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        appBarTheme:AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.deepOrange
          ),
        backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:Colors.white,
            statusBarIconBrightness: Brightness.dark
          ),
          titleTextStyle:TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          elevation: 0.0,
          color: Colors.white
        ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme:BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange
          )
      ),
        home: Home(),
    );
  }
}