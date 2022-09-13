import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/app/injection_container.dart';
import 'package:soq_app/data/network/failure.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/domain/usecases/register_usecase.dart';
import 'package:soq_app/presentation/bloc/auth/register_bloc/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final RegisterUseCase registerUseCase = instance<RegisterUseCase>();
  bool isPassword = true;
  IconData suffex = Icons.visibility_off;
  void changePaasswordVisibility() {
    isPassword = !isPassword;
    suffex = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(RegisterchangePaasswordVisibilityState());
  }

  register({
    required name,
    required email,
    required phone,
    required password,
  }) async {
    emit(RegisterLoadingState());
    Either<Failure, RegisterAuthenticationData> response = await registerUseCase
        .execute(RegisterUseCaseInputs(name, email, phone, password));
    emit(
      response.fold((failure) {
        if (kDebugMode) {
          print(failure.code);
        }
        if (kDebugMode) {
          print(failure.message);
        }
        return RegisterErrorState(failure.message);
      }, (data) {
        return RegisterSuccessState(data);
      }),
    );
  }
}
