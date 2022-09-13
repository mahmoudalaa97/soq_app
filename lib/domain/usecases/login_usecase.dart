import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

import '../../data/network/requstes.dart';

class LoginUseCase extends BaseUseCase<LoginUseCaseInputs, Authentication> {
  final RepositoryImpl _repositoryImpl;
  LoginUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInputs input) async {
    return await _repositoryImpl
        .login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInputs {
  String email;
  String password;
  LoginUseCaseInputs(this.email, this.password);
}
