import 'package:flutter/widgets.dart';
import 'package:my_shop/models/screens/categories/categories_screen.dart';
import 'package:my_shop/models/screens/splash/splash_screen.dart';
import 'models/screens/home/home_screen.dart';
import 'models/screens/sign_in/sign_in_screen.dart';
import 'models/screens/complete_profile/complete_profile_screen.dart';
import 'models/screens/sign_up/sign_up_screen.dart';
import 'models/screens/on_boarding/on_boarding_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
};
