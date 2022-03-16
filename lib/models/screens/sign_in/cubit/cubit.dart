import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/models/screens/sign_in/components/sign_in_model.dart';
import 'package:my_shop/models/screens/sign_in/cubit/states.dart';
import 'package:my_shop/network/end_points.dart';
import 'package:my_shop/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialStates());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  SignInModel? signInModel;

  void userLogin({
  required String email,
  required String password,
  }){
      emit(ShopLoginLoadingStates());
      DioHelper.postData(
          url: LOGIN,
        data: {
            'email': email,
          'password': password,
        },
      ).then((value) {
        signInModel = SignInModel.fromJson(value.data);
        emit(ShopLoginSuccessStates(signInModel!));
      }).catchError((error){
        print(error.toString());
        emit(ShopLoginErrorStates(error.toString()));
      });
    }
  }