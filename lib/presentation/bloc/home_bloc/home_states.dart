// ignore_for_file: unused_field

import 'package:soq_app/domain/models.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final HomeModel homeModel;
  HomeSuccessState(this.homeModel);
}

class HomeErrorState extends HomeStates {
  final String mesg;
  HomeErrorState(this.mesg);
}

//-- Favorites States
class FavoritesLoadingState extends HomeStates {}

class FavoritesSuccessState extends HomeStates {
  final FavoritesModel _favoritesModel;
  FavoritesSuccessState(this._favoritesModel);
}

class FavoritesErrorState extends HomeStates {
  final String _msg;
  FavoritesErrorState(this._msg);
}

class AddOrDeleteFavoritesLoadingState extends HomeStates {}

class AddOrDeleteFavoritesSuccessState extends HomeStates {
  final AddOrDeleteFavoritesModel _addOrDeleteFavoritesModel;
  AddOrDeleteFavoritesSuccessState(this._addOrDeleteFavoritesModel);
}

class AddOrDeleteFavoritesErrorState extends HomeStates {
  final String _msg;
  AddOrDeleteFavoritesErrorState(this._msg);
}

//-- Cart States
class CartLoadingState extends HomeStates {}

class CartSuccessState extends HomeStates {
  final CartModel _cartModel;
  CartSuccessState(this._cartModel);
}

class CartErrorState extends HomeStates {
  final String _msg;
  CartErrorState(this._msg);
}

class AddOrDeleteCartLoadingState extends HomeStates {}

class AddOrDeleteCartSuccessState extends HomeStates {
  final AddOrDeleteCartModel _addOrDeleteCartModel;
  AddOrDeleteCartSuccessState(this._addOrDeleteCartModel);
}

class AddOrDeleteCartErrorState extends HomeStates {
  final String msg;
  AddOrDeleteCartErrorState(this.msg);
}

//-- profile
class ProfileLoadingState extends HomeStates {}

class ProfileSuccessState extends HomeStates {
  final Authentication _authentication;
  ProfileSuccessState(this._authentication);
}

class ProfileErrorState extends HomeStates {
  final String mesg;
  ProfileErrorState(this.mesg);
}

class UpdateProfileLoadingState extends HomeStates {}

class UpdateProfileSuccessState extends HomeStates {
  final Authentication _authentication;
  UpdateProfileSuccessState(this._authentication);
}

class UpdateProfileErrorState extends HomeStates {
  final String mesg;
  UpdateProfileErrorState(this.mesg);
}

class LogoutLoadingState extends HomeStates {}

class LogoutSuccessState extends HomeStates {
  final LogoutModel _logoutModel;
  LogoutSuccessState(this._logoutModel);
}

class LogoutErrorState extends HomeStates {
  final String mesg;
  LogoutErrorState(this.mesg);
}

class LogoutFnSuccessState extends HomeStates {}

class LogoutFnLoadingState extends HomeStates {}

class LogoutFnerorrState extends HomeStates {
  final String _msg;
  LogoutFnerorrState(this._msg);
}

class ChangeLanguageSuccessState extends HomeStates {}
