import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/app/app_prefs.dart';
import 'package:soq_app/app/injection_container.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/presentation/bloc/onboarding/onboarding_states.dart';
import 'package:soq_app/presentation/recources/assets_manger.dart';
import 'package:soq_app/presentation/recources/constants_manger.dart';
import 'package:soq_app/presentation/recources/route_manger.dart';
import 'package:soq_app/presentation/recources/strings_manger.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final PageController onboardingPageController = PageController();
  int currentIndex = 0;
  bool isLast = false;
  List<OnBoardingModel> onboarding = [
    OnBoardingModel(
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTitle1,
        image: ImageAssets.onboarding1),
    OnBoardingModel(
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTitle2,
        image: ImageAssets.onboarding2),
    OnBoardingModel(
        title: AppStrings.onBoardingSubTitle3,
        subTitle: AppStrings.onBoardingSubTitle3,
        image: ImageAssets.onboarding3),
  ];
  onPageChanged(int index) {
    if (index == onboarding.length - 1) {
      isLast = true;
      emit(IsLastState());
    } else {
      isLast = false;
      emit(IsLastState());
    }
  }

  int _nextPage() {
    ++currentIndex;
    return currentIndex;
  }

  submit(context) {
    _appPreferences.setOnBoardingScreenViewed().then(
          (value) => Navigator.pushReplacementNamed(context, Routes.loginRoute),
        );
    emit(SubmitState());
  }

  animateToPage() {
    onboardingPageController.animateToPage(
      _nextPage(),
      //++currentIndex,
      duration: const Duration(microseconds: AppConstant.sliderAnimationTime),
      curve: Curves.bounceInOut,
    );
    emit(NextPageState());
  }

  onPressed(context) {
    if (isLast) {
      submit(context);
    } else {
      animateToPage();
    }
  }
}
