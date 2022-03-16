import 'package:my_shop/models/screens/complete_profile/components/sign_up_model.dart';

abstract class ShopRegisterStates{}

class ShopRegisterInitialStates extends ShopRegisterStates{}

class ShopRegisterLoadingStates extends ShopRegisterStates{}

class ShopRegisterSuccessStates extends ShopRegisterStates{
  final SignUpModel signUpModel;

  ShopRegisterSuccessStates(this.signUpModel);
}

class ShopRegisterErrorStates extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorStates(this.error);
}