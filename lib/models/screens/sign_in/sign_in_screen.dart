import 'package:flutter/material.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/sign_in/components/body.dart';

import '../../../size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome Back", style: headingStyle),
      ),
      body: Body(),
    );
  }
}
