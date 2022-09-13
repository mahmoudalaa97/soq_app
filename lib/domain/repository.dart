import 'package:dartz/dartz.dart';
import 'package:soq_app/data/network/failure.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/domain/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegisterAuthenticationData>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, HomeModel>> home();
  Future<Either<Failure, FavoritesModel>> getFavorites();
  Future<Either<Failure, AddOrDeleteFavoritesModel>> addOrDeleteFavorites(
      FavoritesRequest favoritesRequest);
  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, AddOrDeleteCartModel>> addOrDeleteCart(
      CartRequest cartRequest);
  Future<Either<Failure, Authentication>> getProfile();
  Future<Either<Failure, Authentication>> updateProfile(
      UpdateProfileRequest updateProfileRequest);
  Future<Either<Failure, SearchModel>> getSearch(SearchRequest searchRequest);
  Future<Either<Failure, LogoutModel>> logout(LogoutRequest logoutRequest);
}
