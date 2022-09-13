import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class CartUseCase extends BaseUseCase<void, CartModel> {
  final RepositoryImpl _repositoryImpl;
  CartUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, CartModel>> execute(void input) async {
    return await _repositoryImpl.getCart();
  }
}
