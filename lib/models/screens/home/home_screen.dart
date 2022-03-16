import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/components/coustom_bottom_nav_bar.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/size_config.dart';

import '../../../enums.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return Scaffold(
          body: screens[homeCubit.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BottomNavBar(
                context,
                homeCubit.currentIndex,
                getProportionateScreenWidth(400),
                bottomNavItems,
                bottomNavIcons),
          ),
        );
      },
    );
  }
}
