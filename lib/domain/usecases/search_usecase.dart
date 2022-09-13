import 'package:soq_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:soq_app/data/repository/repository_impl.dart';
import 'package:soq_app/domain/usecases/base_usecase.dart';

import '../../data/network/requstes.dart';
import '../models.dart';

class SearchUseCaase implements BaseUseCase<SearchUseCaaseInputs, SearchModel> {
  final RepositoryImpl _repositoryImpl;
  SearchUseCaase(this._repositoryImpl);

  @override
  Future<Either<Failure, SearchModel>> execute(
      SearchUseCaaseInputs input) async {
    return await _repositoryImpl.getSearch(SearchRequest(input.text));
  }
}

class SearchUseCaaseInputs {
  String text;
  SearchUseCaaseInputs(this.text);
}
