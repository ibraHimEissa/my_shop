import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/on_boarding/components/body.dart';
import 'package:my_shop/models/screens/sign_in/sign_in_screen.dart';
import 'package:my_shop/network/local/cache_helper.dart';
import 'package:my_shop/size_config.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/onboarding";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: const Text(
              'SKIP',
              style: TextStyle(
                color: ePrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              await CacheHelper.putData(key: 'onBoarding', value: 'true');
              log(await CacheHelper.getData(key: 'onBoarding'));
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
      body: Body(),
    );
  }
}
