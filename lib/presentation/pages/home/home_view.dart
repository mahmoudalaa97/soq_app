import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/app/constants.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/presentation/bloc/home_bloc/home_cubit.dart';
import 'package:soq_app/presentation/bloc/home_bloc/home_states.dart';
import 'package:soq_app/presentation/recources/color_manger.dart';
import 'package:soq_app/presentation/recources/constants_manger.dart';
import 'package:soq_app/presentation/recources/fonts_manger.dart';
import 'package:soq_app/presentation/recources/strings_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';
import 'package:soq_app/presentation/screens/description_screen.dart';
import 'package:soq_app/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is AddOrDeleteFavoritesSuccessState ||
          state is AddOrDeleteCartSuccessState) {}
    }, builder: (context, state) {
      return BuildCondition(
        condition: HomeCubit.get(context).homMeodel != null,
        builder: (context) => productsBuilder(
          HomeCubit.get(context).homMeodel!,
          context,
        ),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      );
    });
  }

  Widget productsBuilder(HomeModel model, context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data!.banners
                  .map(
                    (e) => CachedNetworkImage(
                      imageUrl: e.image,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: AppSize.s250,
                viewportFraction: AppSize.s1_5,
                initialPage: AppConstant.initialPage,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval:
                    const Duration(seconds: AppConstant.autoPlayInterval),
                autoPlayAnimationDuration: const Duration(
                    seconds: AppConstant.autoPlayAnimationDuration),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: AppSize.s15),
            Container(
              color: ColorsManger.lightGrey,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: AppSize.s2,
                mainAxisSpacing: AppSize.s1,
                crossAxisSpacing: AppSize.s1,
                childAspectRatio: AppSize.childAspectRatio,
                children: List.generate(
                  model.data!.products.length,
                  (int index) =>
                      buildGridProduct(model.data!.products[index], context),
                ),
              ),
            ),
          ],
        ),
      );
}

Widget buildGridProduct(ProductsModel model, context) => InkWell(
      onTap: () {
        navigateTo(
            context,
            DescriptionScreen(
              image: model.image,
              name: model.name,
              price: model.price,
              id: model.id,
              description: model.description,
            ));
      },
      child: Container(
        color: ColorsManger.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                productImage(
                  imageUrl: model.image,
                  height: AppSize.s180,
                  width: double.infinity,
                ),
                if (model.discount != Constants.zero)
                  Container(
                    padding: const EdgeInsets.all(AppSize.s5),
                    color: ColorsManger.red,
                    child: Text(
                      AppStrings.discount.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Column(
                children: [
                  Text(
                    model.name,
                    maxLines: AppSize.s2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: FontSize.s14,
                      height: AppSize.s1_3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${model.price.round()}",
                        maxLines: AppSize.s2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWaightManger.bold,
                          fontSize: FontSize.s13,
                          height: AppSize.s1_3,
                          color: ColorsManger.blue,
                        ),
                      ),
                      const SizedBox(width: AppSize.s3),
                      if (model.discount != Constants.zero)
                        Text(
                          "${model.oldPrice.round()}",
                          maxLines: AppSize.s2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWaightManger.bold,
                            fontSize: FontSize.s11,
                            height: AppSize.s1_3,
                            decoration: TextDecoration.lineThrough,
                            color: ColorsManger.lightGrey,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          HomeCubit.get(context).addOrDeleteCart(model.id);
                        },
                        icon: CircleAvatar(
                          radius: AppSize.s12,
                          backgroundColor:
                              HomeCubit.get(context).cart![model.id]!
                                  ? Colors.red
                                  : Colors.grey,
                          child: const Icon(
                            Icons.shopping_cart,
                            size: AppSize.s18,
                            color: ColorsManger.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          HomeCubit.get(context).addOrDeleteFavorites(model.id);
                        },
                        icon: CircleAvatar(
                          radius: AppSize.s12,
                          backgroundColor:
                              HomeCubit.get(context).favorits[model.id]!
                                  ? Colors.blue
                                  : Colors.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            size: AppSize.s18,
                            color: ColorsManger.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
