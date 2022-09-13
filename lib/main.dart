import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:soq_app/app/app.dart';
import 'package:soq_app/app/bloc_observer.dart';
import 'package:soq_app/app/injection_container.dart';
import 'package:soq_app/presentation/recources/language_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      child: Phoenix(child: MyApp()),
    ),
  );
}
