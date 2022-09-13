import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class FavoritesUseCase extends BaseUseCase<void, FavoritesModel> {
  final RepositoryImpl _repositoryImpl;
  FavoritesUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, FavoritesModel>> execute(void input) async {
    return await _repositoryImpl.getFavorites();
  }
}
