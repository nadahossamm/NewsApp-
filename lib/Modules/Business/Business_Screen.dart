import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/Cubit/Cubit.dart';
import 'package:newsapplication/Cubit/States.dart';
import 'package:newsapplication/Shared/components.dart';

class businessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list=NewsCubit.get(context).business;
          return list.length > 0 ?
           ListView.separated(itemBuilder: (context, index) => buildTaskItem(list[index]),
               separatorBuilder: (context, index) => Divider(),
               itemCount: list.length,
           physics:BouncingScrollPhysics() ,)
          :
           Center(
          child: CircularProgressIndicator(),
          );
        },
    );
  }
}
