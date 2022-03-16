import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/size_config.dart';

Widget buildCatItem(cModel, int index) => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    children: [
      ExtendedImage.network(
        cModel.data!.data![index].image!,
        fit: BoxFit.cover,
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenWidth(100),
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        cModel.data!.data![index].name!,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(18),
          fontWeight: FontWeight.w600,
          color: ePrimaryColor,
        ),
      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios),
    ],
  ),
);