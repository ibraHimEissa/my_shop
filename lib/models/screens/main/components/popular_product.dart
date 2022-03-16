import 'package:flutter/material.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/main/components/product_card.dart';
import 'package:my_shop/models/screens/main/components/section_title.dart';
import 'package:my_shop/size_config.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hModel = HomeCubit.get(context).homeModel;
    int hLength = hModel!.data!.products!.length.toInt();
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {
            HomeCubit.get(context).changeBottomNavBar(2, context);
          }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: getProportionateScreenWidth(217),
            child: Row(
              children: [
                ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: hLength,
                  itemBuilder: (context ,index) => ProductCard(hModel, context, index),
                  separatorBuilder: (BuildContext context, int index) {	return const SizedBox(
                    width: 15,
                  );},)
              ],
            ),
          ),
        )
      ],
    );
  }
}
