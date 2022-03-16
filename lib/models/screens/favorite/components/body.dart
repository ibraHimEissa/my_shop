import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/home/cubit/state.dart';
import 'package:my_shop/models/screens/main/components/home_header.dart';

import '../../../../size_config.dart';
import 'bulid_fav_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                HomeHeader(),
                Expanded(
                  child: BuildCondition(
                    condition: state is !HomeLoadingGetFavoritesState,
                    builder: (context) {
                      var fModel = HomeCubit.get(context).favoritesModel;
                      int fLength = fModel!.data!.data!.length.toInt();
                      return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: getProportionateScreenWidth(10)),
                              SizedBox(
                                height: getProportionateScreenWidth(fLength * 140),
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      buildFavItem(fModel, index,context),
                                  separatorBuilder: (context, index) => Divider(),
                                  itemCount: fLength,
                                ),
                              ),
                            ],
                          ));
                    },
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
