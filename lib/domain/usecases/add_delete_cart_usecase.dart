import 'package:dartz/dartz.dart';
import 'package:soq_app/data/network/failure.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class AddOrDeleteCartUseCase
    extends BaseUseCase<AddOrDeleteCartUseCaseinputs, AddOrDeleteCartModel> {
  final RepositoryImpl _repositoryImpl;
  AddOrDeleteCartUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, AddOrDeleteCartModel>> execute(
      AddOrDeleteCartUseCaseinputs input) async {
    return await _repositoryImpl.addOrDeleteCart(CartRequest(input.productId));
  }
}

class AddOrDeleteCartUseCaseinputs {
  int productId;
  AddOrDeleteCartUseCaseinputs(this.productId);
}
