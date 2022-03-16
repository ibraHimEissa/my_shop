import 'package:flutter/material.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register Account", style: headingStyle),
      ),
      body: Body(),
    );
  }
}
