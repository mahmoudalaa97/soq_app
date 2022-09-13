import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/presentation/recources/fonts_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';
import '../../bloc/home_bloc/home_cubit.dart';
import '../../bloc/home_bloc/home_states.dart';
import '../../recources/color_manger.dart';
import '../../recources/strings_manger.dart';
import '../../screens/description_screen.dart';
import '../../widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            if (HomeCubit.get(context).isCartEmpty == true)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: AppSize.s160),
                child: Column(
                  children: [
                    const Center(
                        child: Icon(
                      Icons.favorite_border_outlined,
                      size: AppSize.s200,
                      color: ColorsManger.grey,
                    )),
                    Text(
                      AppStrings.favoritesEmpty.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            Expanded(
              child: BuildCondition(
                condition: state is! CartLoadingState,
                builder: (context) => ListView.separated(
                  itemBuilder: (context, index) => bulidProductsItem(
                      HomeCubit.get(context).cartModel!, context, index),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: HomeCubit.get(context).cartProducts!.length,
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
            if (HomeCubit.get(context).isCartEmpty != true)
              Container(
                padding: const EdgeInsets.all(AppSize.s10),
                margin: const EdgeInsets.all(AppSize.s10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppStrings.totalPrice.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      "${HomeCubit.get(context).cartModel!.data.total}  ${AppStrings.le.tr()}",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

Widget bulidProductsItem(CartModel model, context, int index,
        {bool isOldPrice = true}) =>
    InkWell(
      onTap: () {
        navigateTo(
          context,
          DescriptionScreen(
            image: model.data.cartItems[index].product!.image,
            name: model.data.cartItems[index].product!.name,
            price: model.data.cartItems[index].product!.price,
            id: model.data.cartItems[index].product!.id,
            description: model.data.cartItems[index].product!.description,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(AppSize.s20),
        height: AppSize.s120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                productImage(
                  imageUrl: model.data.cartItems[index].product!.image,
                ),
                if (model.data.cartItems[index].product!.discount != 0 &&
                    isOldPrice)
                  Container(
                    padding: const EdgeInsets.all(AppSize.s4),
                    color: ColorsManger.red,
                    child: Text(
                      AppStrings.discount.tr(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppSize.s20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.data.cartItems[index].product!.name,
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
                        "${model.data.cartItems[index].product!.price}",
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
                      if (model.data.cartItems[index].product!.discount != 0 &&
                          isOldPrice)
                        Text(
                          "${model.data.cartItems[index].product!.oldPrice}",
                          maxLines: AppSize.s2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize.s12,
                            height: AppSize.s1_3,
                            decoration: TextDecoration.lineThrough,
                            color: ColorsManger.grey,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          HomeCubit.get(context).addOrDeleteCart(
                              model.data.cartItems[index].product!.id);
                        },
                        icon: CircleAvatar(
                          radius: AppSize.s15,
                          backgroundColor: HomeCubit.get(context).cart![
                                  model.data.cartItems[index].product!.id]!
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
                              model.data.cartItems[index].product!.id);
                        },
                        icon: CircleAvatar(
                          radius: AppSize.s15,
                          backgroundColor: HomeCubit.get(context).favorits[
                                  model.data.cartItems[index].product!.id]!
                              ? ColorsManger.blue
                              : ColorsManger.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
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
      ),
    );
