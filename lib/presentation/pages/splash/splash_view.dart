import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soq_app/app/app_prefs.dart';
import 'package:soq_app/app/injection_container.dart';
import 'package:soq_app/presentation/recources/assets_manger.dart';
import 'package:soq_app/presentation/recources/color_manger.dart';
import 'package:soq_app/presentation/recources/constants_manger.dart';
import 'package:soq_app/presentation/recources/route_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
  }

  _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              //navigate to LayoutScreen
              Navigator.pushReplacementNamed(context, Routes.layoutRoute),
            }
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            //navigate to login screen
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute),
                          }
                        else
                          {
                            //navigate to onBoarding screen
                            Navigator.pushReplacementNamed(
                                context, Routes.onBoardingRoute),
                          }
                      }),
            },
        });
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.primary,
        elevation: AppSize.s0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorsManger.primary,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorsManger.primary,
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s100),
        child: Center(
          child: SvgPicture.asset(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
