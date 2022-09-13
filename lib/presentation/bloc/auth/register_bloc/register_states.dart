import 'package:soq_app/domain/models.dart';

abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterchangePaasswordVisibilityState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterAuthenticationData authenticationData;
  RegisterSuccessState(this.authenticationData);
}

class RegisterErrorState extends RegisterStates {
  final String msg;
  RegisterErrorState(this.msg);
}
