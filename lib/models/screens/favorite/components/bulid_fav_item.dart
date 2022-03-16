import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_shop/models/screens/favorite/model/favorites_model.dart';
import 'package:my_shop/models/screens/home/cubit/cubit.dart';
import 'package:my_shop/models/screens/home/cubit/state.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

Widget buildFavItem(FavoritesModel model, int index, context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ExtendedImage.network(
                          model.data!.data![index].product!.image ?? '')
                      //Image.asset(cart.product.images[0]),
                      ),
                ),
              ),
              if (model.data!.data![index].product!.discount != 0)
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
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.data!.data![index].product!.name ?? '',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "\$${model.data!.data![index].product!.price ?? ''}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ePrimaryColor),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        if (model.data!.data![index].product!.discount != 0)
                          Text(
                            "\$${model.data!.data![index].product!.oldPrice}",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(10),
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        HomeCubit.get(context)
                            .changeFavorites(model.data!.data![index].product!.id ?? 0);
                        HomeCubit.get(context).emit(HomeLoadingGetFavoritesState());
                      },
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          color: HomeCubit.get(context)
                                      .favorites[model.data!.data![index].product!.id] ??
                                  false
                              ? ePrimaryColor.withOpacity(0.15)
                              : eSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: HomeCubit.get(context)
                                      .favorites[model.data!.data![index].product!.id] ??
                                  false
                              ? const Color(0xFFFF4848)
                              : const Color(0xFFDBDEE4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );


