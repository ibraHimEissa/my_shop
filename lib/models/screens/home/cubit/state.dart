abstract class HomeStates{}

class HomeInitialState extends HomeStates {}

class HomeBottomNavState extends HomeStates{}

class HomeLoadingDataState extends HomeStates{}
class HomeSuccessDataState extends HomeStates{}
class HomeErrorDataState extends HomeStates{
  final String error;
  HomeErrorDataState(this.error);
}

class HomeSuccessChangeFavoritesState extends HomeStates{}
class HomeErrorChangeFavoritesState extends HomeStates{
  final String error;
  HomeErrorChangeFavoritesState(this.error);
}

class HomeSuccessGetFavoritesState extends HomeStates{}
class HomeLoadingGetFavoritesState extends HomeStates{}
class HomeErrorGetFavoritesState extends HomeStates{
  final String error;
  HomeErrorGetFavoritesState(this.error);
}

class UserLoadingDataState extends HomeStates{}
class UserSuccessDataState extends HomeStates{}
class UserErrorDataState extends HomeStates{
  final String error;
  UserErrorDataState(this.error);
}


