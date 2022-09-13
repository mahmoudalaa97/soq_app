import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class ProfileUseCase implements BaseUseCase<void, Authentication> {
  final RepositoryImpl _repositoryImpl;
  ProfileUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, Authentication>> execute(void input) async {
    return await _repositoryImpl.getProfile();
  }
}
