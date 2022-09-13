// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/presentation/bloc/home_bloc/home_cubit.dart';
import 'package:soq_app/presentation/bloc/home_bloc/home_states.dart';
import 'package:soq_app/presentation/recources/color_manger.dart';
import 'package:soq_app/presentation/recources/fonts_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';
import 'package:soq_app/presentation/screens/description_screen.dart';

import '../bloc/auth/search_bloc/search_cubit.dart';
import '../bloc/auth/search_bloc/search_states.dart';
import '../recources/strings_manger.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: AppSize.s0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    deffaultFormField(
                      controller: searchController,
                      labelText: AppStrings.search.tr(),
                      prefix: Icons.search,
                      validate: (value) {
                        if (value != null || value!.isEmpty) {
                          return AppStrings.enterTextToSearch.tr();
                        }
                        return null;
                      },
                      onFieldSubmitted: (String text) {
                        SearchCubit.get(context).getSearch(text);
                      },
                    ),
                    const SizedBox(height: AppSize.s15),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(height: AppSize.s15),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              navigateTo(
                                context,
                                DescriptionScreen(
                                  image: SearchCubit.get(context)
                                      .searchModel
                                      ?.data
                                      ?.data[index]
                                      .image,
                                  name: SearchCubit.get(context)
                                      .searchModel
                                      ?.data
                                      ?.data[index]
                                      .name,
                                  price: SearchCubit.get(context)
                                      .searchModel
                                      ?.data
                                      ?.data[index]
                                      .price,
                                  id: SearchCubit.get(context)
                                      .searchModel
                                      ?.data
                                      ?.data[index]
                                      .id,
                                  description: SearchCubit.get(context)
                                      .searchModel
                                      ?.data
                                      ?.data[index]
                                      .description,
                                ),
                              );
                            },
                            child: bulidProductsItem(
                              SearchCubit.get(context).searchModel!,
                              context,
                              index,
                            ),
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: SearchCubit.get(context)
                              .searchModel!
                              .data!
                              .data
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bulidProductsItem(
    SearchModel model,
    context,
    int index,
  ) =>
      BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(AppSize.s20),
            height: AppSize.s120,
            child: Row(
              children: [
                productImage(
                  imageUrl: model.data!.data[index].image,
                ),
                const SizedBox(width: AppSize.s20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.data!.data[index].name,
                        maxLines: AppSize.s2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.s14,
                          height: AppSize.s1_3,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "${model.data!.data[index].price}",
                            maxLines: AppSize.s2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.s14,
                              height: AppSize.s1_3,
                              color: ColorsManger.blue,
                            ),
                          ),
                          const SizedBox(width: AppSize.s10),
                          IconButton(
                            onPressed: () {
                              HomeCubit.get(context)
                                  .addOrDeleteCart(model.data!.data[index].id);
                            },
                            icon: CircleAvatar(
                              radius: AppSize.s15,
                              backgroundColor: HomeCubit.get(context)
                                          .cart![model.data!.data[index].id]! ||
                                      state is AddOrDeleteFavoritesSuccessState
                                  ? ColorsManger.red
                                  : ColorsManger.grey,
                              child: const Icon(
                                Icons.shopping_cart,
                                color: ColorsManger.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              HomeCubit.get(context).addOrDeleteFavorites(
                                  model.data!.data[index].id);
                            },
                            icon: CircleAvatar(
                              radius: AppSize.s15,
                              backgroundColor: HomeCubit.get(context).favorits[
                                          model.data!.data[index].id]! ||
                                      state is AddOrDeleteFavoritesSuccessState
                                  ? ColorsManger.blue
                                  : ColorsManger.grey,
                              child: const Icon(
                                Icons.favorite_border,
                                color: ColorsManger.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
}
