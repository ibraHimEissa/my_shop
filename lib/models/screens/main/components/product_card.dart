import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/home/model/home_model.dart';
import 'package:my_shop/models/screens/main/model/products.dart';
import 'package:my_shop/size_config.dart';

Widget ProductCard(HomeModel model, context,index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: SizedBox(
      width: getProportionateScreenWidth(140),
      child: GestureDetector(
        onTap: () => {
          /*Navigator.pushNamed(context,DetailsScreen.routeName,arguments: ProductDetailsArguments(product: product),*/
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                AspectRatio(
                  aspectRatio: 1.01,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: eSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Hero(
                      tag: model.data!.products![index].id.toString(),
                      child: ExtendedImage.network(
                        model.data!.products![index].image!,
                        fit: BoxFit.cover,
                        width: getProportionateScreenWidth(50),
                      ),
                    ),
                  ),
                ),
                if(model.data!.products![index].discount != 0)
                  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              model.data!.products![index].name.toString(),
              style: TextStyle(color: Colors.black,
              height: 1.1),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${model.data!.products![index].price}",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: ePrimaryColor,
                  ),
                ),
                if(model.data!.products![index].discount != 0)
                Text(
                  "\$${model.data!.products![index].oldPrice}",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(10),
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    HomeCubit.get(context).changeFavorites(model.data!.products![index].id??0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    height: getProportionateScreenWidth(28),
                    width: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color:
                      HomeCubit.get(context).favorites[model.data!.products![index].id] ?? false
                          ? ePrimaryColor.withOpacity(0.15)
                          : eSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color:
                      HomeCubit.get(context).favorites[model.data!.products![index].id] ?? false
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

class eProductCard extends StatelessWidget {
  const eProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.homeModel,
  }) : super(key: key);

  final double width, aspectRetio;
  final HomeModel? homeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: GestureDetector(
          onTap: () => {
            /*Navigator.pushNamed(context,DetailsScreen.routeName,arguments: ProductDetailsArguments(product: product),*/
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: eSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: homeModel!.data!.products![0].id.toString(),
                    child: ExtendedImage.network(
                      homeModel!.data!.products![1].images![0],
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                homeModel!.data!.products![0].name.toString(),
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${homeModel!.data!.products![0].price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: ePrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color:
                            homeModel!.data!.products![0].inFavorites ?? false
                                ? ePrimaryColor.withOpacity(0.15)
                                : eSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color:
                            homeModel!.data!.products![0].inFavorites ?? false
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
