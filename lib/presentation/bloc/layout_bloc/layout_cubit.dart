import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/presentation/bloc/layout_bloc/layout_states.dart';
import 'package:soq_app/presentation/pages/cart/cart_view.dart';
import 'package:soq_app/presentation/pages/favorites/favorites_view.dart';
import 'package:soq_app/presentation/pages/home/home_view.dart';
import 'package:soq_app/presentation/pages/settings/settings_view.dart';
import 'package:soq_app/presentation/recources/strings_manger.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeBottomNavigationBarItems(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationBarItemsState());
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: AppStrings.home.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.favorite),
      label: AppStrings.favorites.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.shopping_cart),
      label: AppStrings.cart.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.settings),
      label: AppStrings.settings.tr(),
    ),
  ];
  List<Widget> screens = [
    const HomeView(),
    const FavoritesView(),
    const CartView(),
    SettingsView(),
  ];
}
