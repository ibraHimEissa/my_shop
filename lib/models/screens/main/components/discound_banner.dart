import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/models/screens/home/model/home_model.dart';
import 'package:my_shop/size_config.dart';

Widget DiscountBanner(HomeModel? model) => Column(
      children: [
        CarouselSlider(
          items: model!.data!.banners!
              .map((e) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(getProportionateScreenWidth(10)),
                      height: getProportionateScreenWidth(120),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: ExtendedNetworkImageProvider(
                            e.image ?? '',
                            cache: true,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            height: getProportionateScreenWidth(120),
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            scrollDirection: Axis.horizontal,
            //viewportFraction: 1,
          ),
        ),
      ],
    );
