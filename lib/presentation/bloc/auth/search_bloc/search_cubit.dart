import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/app/injection_container.dart';
import 'package:soq_app/domain/usecases/search_usecase.dart';
import 'package:soq_app/presentation/bloc/auth/search_bloc/search_states.dart';

import '../../../../domain/models.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchUseCaase _searchUseCaase = instance<SearchUseCaase>();
  SearchModel? searchModel;
  getSearch(String text) async {
    emit(SearchLoadingState());
    var response = await _searchUseCaase.execute(SearchUseCaaseInputs(text));
    emit(response.fold((failure) {
      if (kDebugMode) {
        print(failure.code);
      }
      if (kDebugMode) {
        print(failure.message);
      }
      return SearchErrorState(failure.message);
    }, (data) {
      searchModel = data;
      return SearchSuccessState(data);
    }));
  }
}
