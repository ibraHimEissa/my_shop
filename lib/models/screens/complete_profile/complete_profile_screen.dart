import 'package:flutter/material.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/complete_profile/components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Complete Profile", style: headingStyle),
      ),
      body: Body(),
    );
  }
}
