import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/presentation/bloc/onboarding/onboarding_cubit.dart';
import 'package:soq_app/presentation/bloc/onboarding/onboarding_states.dart';
import 'package:soq_app/presentation/recources/color_manger.dart';
import 'package:soq_app/presentation/recources/strings_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Scaffold(
          backgroundColor: ColorsManger.white,
          appBar: AppBar(
            backgroundColor: ColorsManger.white,
            elevation: AppSize.s0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: TextButton(
                  onPressed: () {
                    cubit.submit(context);
                  },
                  child: Text(
                    AppStrings.skip.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppSize.s40),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: cubit.onboardingPageController,
                    itemCount: cubit.onboarding.length,
                    onPageChanged: (index) {
                      cubit.currentIndex = index;
                      cubit.onPageChanged(index);
                    },
                    itemBuilder: (context, index) =>
                        _onboardingWidgetItem(cubit.onboarding[index]),
                  ),
                ),
                const SizedBox(height: AppSize.s28),
                _indecatorWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _onboardingWidgetItem(OnBoardingModel onBoardingModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SvgPicture.asset(onBoardingModel.image)),
        Text(
          onBoardingModel.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: AppSize.s15),
        Text(
          onBoardingModel.subTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget _indecatorWidget() => BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);
          return Row(
            children: [
              SmoothPageIndicator(
                controller: cubit.onboardingPageController,
                count: cubit.onboarding.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: ColorsManger.primary,
                  dotColor: ColorsManger.grey,
                  dotHeight: AppSize.s11,
                  dotWidth: AppSize.s11,
                  spacing: AppSize.s6,
                ),
              ),
              const Spacer(),
              _floatingActionButton(),
            ],
          );
        },
      );

  Widget _floatingActionButton() =>
      BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);
          return FloatingActionButton(
            onPressed: () {
              cubit.onPressed(context);
            },
            backgroundColor: ColorsManger.primary,
            foregroundColor: ColorsManger.grey,
            splashColor: ColorsManger.white,
            child: const Icon(Icons.arrow_forward_ios),
          );
        },
      );
}
