import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/models/screens/favorite/model/favorites_model.dart';
import 'package:my_shop/models/screens/home/cubit/state.dart';
import 'package:my_shop/models/screens/home/model/categories_model.dart';
import 'package:my_shop/models/screens/home/model/change_favorites_model.dart';
import 'package:my_shop/models/screens/home/model/home_model.dart';
import 'package:my_shop/models/screens/profile/model/profile_model.dart';
import 'package:my_shop/network/end_points.dart';
import 'package:my_shop/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  Future<void> changeBottomNavBar(int index, context) async {
    currentIndex = index;
    if (index == 0) {
      log('Home');
    } else if (index == 1) {
      log('Favorite');
    } else if (index == 2) {
      log('Chat');
    } else if (index == 3) {
      log('Profile');
      //await CacheHelper.putData(key: 'token', value: '');
      //Navigator.pushReplacementNamed(context, SignInScreen.routeName);
    }
    emit(HomeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(HomeLoadingDataState());
    DioHelper.getData(
      url: Home,
      token: Token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
      });

      log(favorites[52].toString());
      emit(HomeSuccessDataState());
    }).catchError((error) {
      log(error.toString());
      emit(HomeErrorDataState(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    emit(HomeLoadingDataState());
    DioHelper.getData(
      url: CATEGORIES,
      token: Token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      log(categoriesModel!.status.toString());
      emit(HomeSuccessDataState());
    }).catchError((error) {
      log(error.toString());
      emit(HomeErrorDataState(error.toString()));
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(HomeSuccessChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITE,
      data: {
        'product_id' : productId,
      },
      token: Token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      emit(HomeSuccessChangeFavoritesState());
      getFavoritesData();
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(HomeErrorChangeFavoritesState(error));
    });
  }

  FavoritesModel? favoritesModel;
  void getFavoritesData() {
    emit(HomeLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITE,
      token: Token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      log(favoritesModel!.status.toString());
      emit(HomeSuccessGetFavoritesState());
    }).catchError((error) {
      log(error.toString());
      emit(HomeErrorGetFavoritesState(error.toString()));
    });
  }

  ProfileModel? profileModel;
  void getUserData() {
    emit(UserLoadingDataState());
    DioHelper.getData(
      url: PROFILE,
      token: Token,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      log(profileModel!.status.toString());
      emit(UserSuccessDataState());
    }).catchError((error) {
      log(error.toString());
      emit(UserErrorDataState(error.toString()));
    });
  }

}
