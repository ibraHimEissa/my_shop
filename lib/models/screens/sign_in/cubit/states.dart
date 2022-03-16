import 'package:my_shop/models/screens/sign_in/components/sign_in_model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialStates extends ShopLoginStates{}

class ShopLoginLoadingStates extends ShopLoginStates{}

class ShopLoginSuccessStates extends ShopLoginStates{
  final SignInModel signInModel;

  ShopLoginSuccessStates(this.signInModel);
}

class ShopLoginErrorStates extends ShopLoginStates{
  final String error;
  ShopLoginErrorStates(this.error);
}