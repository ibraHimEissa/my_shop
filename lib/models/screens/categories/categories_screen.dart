import 'package:flutter/material.dart';
import 'package:my_shop/models/screens/categories/components/body.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = "/categories";

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
