import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class RegisterUseCase
    extends BaseUseCase<RegisterUseCaseInputs, RegisterAuthenticationData> {
  final RepositoryImpl _repositoryImpl;
  RegisterUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, RegisterAuthenticationData>> execute(
      RegisterUseCaseInputs input) async {
    return await _repositoryImpl.register(RegisterRequest(
      input.name,
      input.email,
      input.phone,
      input.password,
    ));
  }
}

class RegisterUseCaseInputs {
  String name;
  String email;
  String phone;
  String image =
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-29ce0.appspot.com/o/businessman-character-avatar-isolated_24877-60111.webp?alt=media&token=7d0013ba-d679-4d7d-b12c-f9b21ce7e7f8";

  String password;

  RegisterUseCaseInputs(this.name, this.email, this.phone, this.password);
}
