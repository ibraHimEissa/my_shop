import 'dart:developer';

import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/home/cubit/state.dart';
import 'package:my_shop/models/screens/home/model/home_model.dart';
import 'package:my_shop/models/screens/main/components/categoris.dart';
import 'package:my_shop/models/screens/main/components/home_header.dart';
import 'package:my_shop/models/screens/main/components/popular_product.dart';
import 'package:my_shop/models/screens/main/components/special_offers.dart';
import 'package:my_shop/size_config.dart';

import 'discound_banner.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
    listener: (context, state) {},
    builder: (context, state) {
    return BuildCondition(
            condition: state is! HomeLoadingDataState,
            builder: (context) {
              var hModel = HomeCubit.get(context).homeModel;
              var cModel = HomeCubit.get(context).categoriesModel;
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(20)),
                      HomeHeader(),
                      SizedBox(height: getProportionateScreenWidth(10)),
                      DiscountBanner(hModel),
                      Categories(),
                      SpecialOffers(cModel),
                      SizedBox(height: getProportionateScreenWidth(30)),
                      PopularProducts(),
                      SizedBox(height: getProportionateScreenWidth(30)),
                    ],
                  ),
                ),
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
