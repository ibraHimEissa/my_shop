import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/screens/complete_profile/components/sign_up_model.dart';
import 'package:my_shop/models/screens/complete_profile/cubit/states.dart';
import 'package:my_shop/network/end_points.dart';
import 'package:my_shop/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialStates());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  late String email;
  late String password;

  SignUpModel? signUpModel;

  void userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(ShopRegisterLoadingStates());
    DioHelper.postData(
      url: REGESTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      emit(ShopRegisterSuccessStates(signUpModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorStates(error.toString()));
    });
  }
}
