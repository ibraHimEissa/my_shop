import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/screens/categories/components/category_item.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/home/cubit/state.dart';
import 'package:my_shop/models/screens/main/components/discound_banner.dart';
import 'package:my_shop/models/screens/main/components/home_header.dart';
import 'package:my_shop/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BuildCondition(
            condition: HomeCubit.get(context).homeModel != null,
            builder: (context) {
              var hModel = HomeCubit.get(context).homeModel;
              var cModel = HomeCubit.get(context).categoriesModel;
              int cLength = cModel!.data!.data!.length.toInt();
              return SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    HomeHeader(),
                    SizedBox(height: getProportionateScreenWidth(10)),
                    DiscountBanner(hModel),
                    SizedBox(
                      height: getProportionateScreenWidth(cLength * 100),
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildCatItem(cModel, index),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: cLength,
                      ),
                    ),
                  ],
                )),
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
