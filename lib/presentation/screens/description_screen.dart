// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:soq_app/presentation/bloc/home_bloc/home_states.dart';
import 'package:soq_app/presentation/recources/color_manger.dart';
import 'package:soq_app/presentation/recources/strings_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';
import 'package:soq_app/presentation/widgets/widgets.dart';

import '../bloc/home_bloc/home_cubit.dart';

class DescriptionScreen extends StatelessWidget {
  String? image;
  String? name;
  double? price;
  int? id;
  String? description;
  DescriptionScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.id,
      required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: AppSize.s0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: productImage(
                      height: AppSize.s300,
                      width: double.infinity,
                      imageUrl: image!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppSize.s20),
                    child: Text(
                      name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    children: [
                      Text(AppStrings.price.tr()),
                      const SizedBox(width: AppSize.s8),
                      Text(
                        "$price",
                        maxLines: AppSize.s2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      const SizedBox(width: AppSize.s10),
                      IconButton(
                        onPressed: () {
                          HomeCubit.get(context).addOrDeleteCart(id!);
                        },
                        icon: CircleAvatar(
                          radius: AppSize.s15,
                          backgroundColor: HomeCubit.get(context).cart![id]! ||
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
                            id!,
                          );
                        },
                        icon: CircleAvatar(
                          radius: AppSize.s15,
                          backgroundColor:
                              HomeCubit.get(context).favorits[id]! ||
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
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
                      child: Text(AppStrings.description.tr())),
                  ReadMoreText(
                    description!,
                    colorClickableText: ColorsManger.blue,
                    trimMode: TrimMode.Line,
                    trimLines: 3,
                    trimCollapsedText: AppStrings.showMore.tr(),
                    trimExpandedText: AppStrings.showLess.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
