import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

class UpdateProfileUseCase
    implements BaseUseCase<UpdateProfileUseCaseInputs, Authentication> {
  final RepositoryImpl _repositoryImpl;
  UpdateProfileUseCase(this._repositoryImpl);
  @override
  Future<Either<Failure, Authentication>> execute(
      UpdateProfileUseCaseInputs input) async {
    return await _repositoryImpl.updateProfile(UpdateProfileRequest(
      input.name,
      input.email,
      input.phone,
      input.password,
    ));
  }
}

class UpdateProfileUseCaseInputs {
  String name;
  String phone;
  String email;
  String password;
  String image =
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-29ce0.appspot.com/o/businessman-character-avatar-isolated_24877-60111.webp?alt=media&token=7d0013ba-d679-4d7d-b12c-f9b21ce7e7f8";

  UpdateProfileUseCaseInputs(
      this.name, this.email, this.phone, this.password, this.image);
}
