import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/home/cubit/state.dart';
import 'package:my_shop/models/screens/profile/components/profile_menu.dart';
import 'package:my_shop/models/screens/profile/components/profile_pic.dart';
import 'package:my_shop/models/screens/sign_in/sign_in_screen.dart';
import 'package:my_shop/network/local/cache_helper.dart';

import '../../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var pModel = HomeCubit.get(context).profileModel;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                ProfilePic(pModel,context),
                SizedBox(height: getProportionateScreenWidth(20)),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "assets/icons/Bell.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/Settings.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () async {
                    await CacheHelper.putData(key: 'token', value: '');
                    Navigator.pushReplacementNamed(
                        context, SignInScreen.routeName);
                  },
                ),
              ],
            ),
          );
        });
  }
}
