import 'package:soq_app/data/data_source/local_data_source.dart';
import 'package:soq_app/data/data_source/remote_data_source.dart';
import 'package:soq_app/data/mapper/mapper.dart';
import 'package:soq_app/data/network/error_handeler.dart';
import 'package:soq_app/data/network/network_info.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/domain/repository.dart';

class RepositoryImpl extends Repository {
  final ReomteDataSource _reomteDataSource;
  final NetworkInfo _networkInfo;
  final LocalDataSource _localDataSource;
  RepositoryImpl(
      this._reomteDataSource, this._networkInfo, this._localDataSource);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterAuthenticationData>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.register(registerRequest);

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeModel>> home() async {
    try {
      final response = await _localDataSource.getHomedata();
      return Right(response.toDomain());
    } catch (cachError) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _reomteDataSource.home();

          if (response.status == ApiInternalStatus.TrueSuccess) {
            _localDataSource.saveHomeToCache(response);
            return Right(response.toDomain());
          } else {
            return Left(
              Failure(
                ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFFAULT,
              ),
            );
          }
        } catch (error) {
          return Left(ErrorHandeler.handel(error).failure);
          //sure error from internet (API)
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, FavoritesModel>> getFavorites() async {
    // final response = await _reomteDataSource.getFavorites();
    // response.toDomain();
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.getFavorites();

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddOrDeleteFavoritesModel>> addOrDeleteFavorites(
      FavoritesRequest favoritesRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _reomteDataSource.addOrDeleteFavorites(favoritesRequest);

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.getCart();

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddOrDeleteCartModel>> addOrDeleteCart(
      CartRequest cartRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.addOrDeleteCart(cartRequest);

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> getProfile() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.getProfile();

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _reomteDataSource.updateProfile(updateProfileRequest);

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SearchModel>> getSearch(
      SearchRequest searchRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.getSearch(searchRequest);

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, LogoutModel>> logout(
      LogoutRequest logoutRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reomteDataSource.logout(logoutRequest);

        if (response.status == ApiInternalStatus.TrueSuccess) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandeler.handel(error).failure);
        //sure error from internet (API)
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
