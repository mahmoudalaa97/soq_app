// ignore_for_file: unused_field

import 'package:soq_app/domain/models.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final SearchModel _searchModel;
  SearchSuccessState(this._searchModel);
}

class SearchErrorState extends SearchStates {
  final String _msg;
  SearchErrorState(this._msg);
}
