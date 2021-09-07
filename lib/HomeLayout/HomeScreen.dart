import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/Cubit/Cubit.dart';
import 'package:newsapplication/Cubit/States.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottonNavigate,
              onTap: (index){
                cubit.toggleBetweenScreen(index);
              },

            ),
            body: cubit.screens[cubit.currentIndex],

          );
        },

      ),
    );
  }
}
