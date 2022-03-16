import 'package:flutter/material.dart';
import 'package:my_shop/models/screens/categories/categories_screen.dart';
import 'package:my_shop/size_config.dart';
import 'models/screens/favorite/favorite.dart';
import 'models/screens/main/main_screen.dart';
import 'models/screens/profile/profile_screen.dart';


//here is the app colors
const ePrimaryColor = Color(0xFFFF7643);
const eSecondaryColor = Color(0xFF979797);
const eTextColor = Color(0xFF757575);



const eName ='EissaShop';

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);


const eAnimationDuration = Duration(milliseconds: 200);

String? Token;

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String eEmailNullError = "Please Enter your email";
const String eInvalidEmailError = "Please Enter Valid Email";
const String ePassNullError = "Please Enter your password";
const String eShortPassError = "Password is too short";
const String eMatchPassError = "Passwords don't match";
const String eNameNullError = "Please Enter your name";
const String ePhoneNumberNullError = "Please Enter your phone number";
const String eAddressNullError = "Please Enter your address";


List<IconData> bottomNavIcons = [
  Icons.add_business_sharp,
  Icons.grid_view,
  Icons.favorite,
  Icons.person_outline_rounded,

];

List<String> bottomNavItems = [
  'Home',
  'Category',
  'Favorite',
  'Profile',
];

List<Widget> screens = [
  MainScreen(),
  CategoriesScreen(),
  FavoriteScreen(),
  ProfileScreen(),
];
