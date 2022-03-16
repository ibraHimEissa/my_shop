import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/models/screens/home/model/categories_model.dart';
import 'package:my_shop/models/screens/home/model/home_model.dart';
import 'package:my_shop/models/screens/main/components/section_title.dart';
import 'package:my_shop/size_config.dart';


Widget SpecialOffers(CategoriesModel? model) => Column(
  children: [
    Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SectionTitle(
        title: "Special for you",
        press: () {},
      ),
    ),
    SizedBox(height: getProportionateScreenWidth(20)),
    CarouselSlider(
      items: model!.data!.data!.map((e) => SpecialOfferCard(
        image: e.image??'',
        category: e.name??'',
        numOfBrands: e.id??0,
        press: () {},
      )).toList(),
      options: CarouselOptions(
        height: getProportionateScreenWidth(100),

        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        reverse: false,
        scrollDirection: Axis.horizontal,
        viewportFraction:.68,
        aspectRatio: 1/1.6,
      ),
    ),
  ],
);

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(242),
        //height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: ExtendedNetworkImageProvider(
                      image,
                      cache: true,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15.0),
                  vertical: getProportionateScreenWidth(10),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "$category\n",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "$numOfBrands Brands")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}