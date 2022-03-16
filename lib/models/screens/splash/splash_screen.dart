import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/home/home_screen.dart';
import 'package:my_shop/models/screens/on_boarding/on_boarding_screen.dart';
import 'package:my_shop/models/screens/sign_in/sign_in_screen.dart';
import 'package:my_shop/network/local/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 4), () async {
      nextPage();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> nextPage() async {
    var onBoarding;
    try {
      Token = await CacheHelper.getData(key: 'token');
      onBoarding = await CacheHelper.getData(key: 'onBoarding');
      if (onBoarding == null) {
        await CacheHelper.putData(key: 'onBoarding', value: 'false');
      }
      if (Token == null) {
        await CacheHelper.putData(key: 'token', value: '');
      }
    } on Exception catch (ae) {
      log("Exception: " + ae.toString());
    }
    onBoarding = await CacheHelper.getData(key: 'onBoarding');
    Token = await CacheHelper.getData(key: 'token');
    log('onBoarding = $onBoarding , Token : $Token');
    setState(() {
      if (onBoarding == 'true' && Token =='') {
        Navigator.pushReplacement(
            context, PageTransition(SignInScreen()));
      } else if (onBoarding == 'true' && Token !='') {
        Navigator.pushReplacement(
            context, PageTransition(HomeScreen()));
      }else{
        Navigator.pushReplacement(
            context, PageTransition(OnBoardingScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ePrimaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'EissaShop',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _width / _containerSize,
                  width: _width / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ePrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/splash_1.png')),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );

}
