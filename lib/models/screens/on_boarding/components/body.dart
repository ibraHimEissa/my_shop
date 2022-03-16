import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_shop/components/default_button.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/sign_in/sign_in_screen.dart';
import 'package:my_shop/network/local/cache_helper.dart';
import 'package:my_shop/size_config.dart';

import 'on_boarding_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  var boardController = PageController();
  bool isLast = false;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to $eName, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people connect with store \naround Egypt",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                    if (value == splashData.length - 1) {
                      isLast = true;
                    }
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    Row(
                      children: [
                        Spacer(),
                        FloatingActionButton(
                          onPressed: () async {
                            if (isLast) {
                              await CacheHelper.putData(
                                  key: 'onBoarding', value: 'true');
                              log(await CacheHelper.getData(key: 'onBoarding'));
                              Navigator.pushReplacementNamed(
                                  context, SignInScreen.routeName);
                            } else {
                              boardController.nextPage(
                                duration: eAnimationDuration,
                                curve: Curves.bounceInOut,
                              );
                            }
                          },
                          backgroundColor: ePrimaryColor,
                          child: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: eAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? ePrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
