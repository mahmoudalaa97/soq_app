import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class LogoutUseCase implements BaseUseCase<LogoutUseCaseInpouts, LogoutModel> {
  final RepositoryImpl _repositoryImpl;
  LogoutUseCase(this._repositoryImpl);

  @override
  Future<Either<Failure, LogoutModel>> execute(
      LogoutUseCaseInpouts input) async {
    return await _repositoryImpl.logout(LogoutRequest(input.fcmToken));
  }
}

class LogoutUseCaseInpouts {
  String fcmToken;
  LogoutUseCaseInpouts(this.fcmToken);
}
