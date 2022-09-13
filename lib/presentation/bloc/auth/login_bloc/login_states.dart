import 'package:soq_app/domain/models.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginchangePaasswordVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final Authentication authentication;
  LoginSuccessState(this.authentication);
}

class LoginErrorState extends LoginStates {
  final String mesg;
  LoginErrorState(this.mesg);
}
