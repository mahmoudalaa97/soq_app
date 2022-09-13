import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class AddOrDeleteFavoritesUseCase extends BaseUseCase<
    AddOrDeleteFavoritesUseCaseinputs, AddOrDeleteFavoritesModel> {
  final RepositoryImpl _repositoryImpl;
  AddOrDeleteFavoritesUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, AddOrDeleteFavoritesModel>> execute(
      AddOrDeleteFavoritesUseCaseinputs input) async {
    return await _repositoryImpl
        .addOrDeleteFavorites(FavoritesRequest(input.productId));
  }
}

class AddOrDeleteFavoritesUseCaseinputs {
  int productId;
  AddOrDeleteFavoritesUseCaseinputs(this.productId);
}
