import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/presentation/bloc/layout_bloc/layout_cubit.dart';
import 'package:soq_app/presentation/bloc/layout_bloc/layout_states.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';
import 'package:soq_app/presentation/widgets/widgets.dart';

import '../../screens/search_screen.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: AppSize.s0,
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavigationBarItems(index);
            },
            items: cubit.items,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
