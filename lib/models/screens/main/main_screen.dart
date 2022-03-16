import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/home/cubit/state.dart';
import 'package:my_shop/models/screens/main/components/body.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BuildCondition(
            condition: HomeCubit.get(context).homeModel != null && HomeCubit.get(context).categoriesModel != null,
            builder: (context) => Scaffold(
              body: Body(),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
