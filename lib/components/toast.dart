import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop/size_config.dart';

void showToast ({required String msg,Color? bgColor}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: bgColor,
    textColor: Colors.white,
    fontSize: getProportionateScreenWidth(14),
  );