import 'package:soq_app/app/constants.dart';
import 'package:soq_app/data/responses/responses.dart';
import 'package:soq_app/domain/models.dart';
import 'package:soq_app/app/extontions.dart';

// -- Login Mapper
extension DataResponseMapper on DataResponse? {
  AuthenticationData toDomain() {
    return AuthenticationData(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.phone.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
      this?.token.orEmpty() ?? Constants.empty,
      this?.points.orZero() ?? Constants.zero,
      this?.credit.orZero() ?? Constants.zero,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.data.toDomain());
  }
}

// -- Register Mapper
extension RegisterResponseMapper on RegisterResponse? {
  RegisterAuthentication toDomain() {
    return RegisterAuthentication(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.phone.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
      this?.token.orEmpty() ?? Constants.empty,
    );
  }
}

extension RegisterAuthenticationResponseMapper
    on RegisterAuthenticationResponse? {
  RegisterAuthenticationData toDomain() {
    return RegisterAuthenticationData(this?.data.toDomain());
  }
}

// -- Home Mapper
extension BannersResponseMapper on BannersResponse? {
  BannersModel toDomain() {
    return BannersModel(
      this?.id.orZero() ?? Constants.zero,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension ProductsResponseMapper on ProductsResponse? {
  ProductsModel toDomain() {
    return ProductsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.price.orDouble() ?? Constants.isDouble,
      this?.oldPrice.orDouble() ?? Constants.isDouble,
      this?.discount.orDouble() ?? Constants.isDouble,
      this?.image.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
      this?.inFavorites.orFalse() ?? Constants.boolFalse,
      this?.inCart.orFalse() ?? Constants.boolFalse,
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeModel toDomain() {
    List<BannersModel> banners = (this
                ?.data
                ?.banners
                ?.map((bannersResponse) => bannersResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannersModel>()
        .toList();
    List<ProductsModel> products = (this
                ?.data
                ?.products
                ?.map((productsresponse) => productsresponse.toDomain()) ??
            const Iterable.empty().cast<ProductsModel>())
        .toList();
    var data = HomeDataModel(banners, products);
    return HomeModel(data);
  }
}

// -- Favorites Mapper
extension FavoritesProductResponseMapper on FavoritesProductResponse? {
  FavoritesProductModel toDomain() {
    return FavoritesProductModel(
      this?.id.orZero() ?? Constants.zero,
      this?.price.orDouble() ?? Constants.isDouble,
      this?.oldPrice.orDouble() ?? Constants.isDouble,
      this?.discount.orDouble() ?? Constants.isDouble,
      this?.image.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
    );
  }
}

extension FavoritesProductDataResponseMapper on FavoritesProductDataResponse? {
  FavoritesProductDataModel toDomain() {
    return FavoritesProductDataModel(
      this?.id.orZero() ?? Constants.zero,
      this!.product.toDomain(),
    );
  }
}

extension FavoritesDataResponseMapper on FavoritesDataResponse? {
  FavoritesDataModel toDomain() {
    List<FavoritesProductDataModel> data = (this?.data?.map(
                (favoritesProductDataResponse) =>
                    favoritesProductDataResponse.toDomain()) ??
            const Iterable.empty().cast<FavoritesProductDataModel>())
        .toList();
    return FavoritesDataModel(
      this?.currentPage.orZero() ?? Constants.zero,
      data,
      this?.firstPageUrl.orEmpty() ?? Constants.empty,
      this?.from.orZero() ?? Constants.zero,
      this?.lastPage.orZero() ?? Constants.zero,
      this?.lastPageUrl.orEmpty() ?? Constants.empty,
      this?.nextPageUrl.orEmpty() ?? Constants.empty,
      this?.path.orEmpty() ?? Constants.empty,
      this?.perPage.orZero() ?? Constants.zero,
      this?.prevPageUrl.orEmpty() ?? Constants.empty,
      this?.to.orZero() ?? Constants.zero,
      this?.total.orZero() ?? Constants.zero,
    );
  }
}

extension FavoritesResponseMapper on FavoritesResponse? {
  FavoritesModel toDomain() {
    //FavoritesDataModel data = (this!.data.toDomain());
    return FavoritesModel(this!.data.toDomain());
  }
}

extension AddOrDeleteFavoritesProductResponseMapper
    on AddOrDeleteFavoritesProductResponse? {
  AddOrDeleteFavoritesProductModel toDomain() {
    return AddOrDeleteFavoritesProductModel(
      this?.id.orZero() ?? Constants.zero,
      this?.price.orDouble() ?? Constants.isDouble,
      this?.oldPrice.orDouble() ?? Constants.isDouble,
      this?.discount.orDouble() ?? Constants.isDouble,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension AddOrDeleteFavoritesProductDataResponseMapper
    on AddOrDeleteFavoritesProductDataResponse? {
  AddOrDeleteFavoritesProductDataModel toDomain() {
    return AddOrDeleteFavoritesProductDataModel(
      this?.id.orZero() ?? Constants.zero,
      this!.product.toDomain(),
    );
  }
}

extension AddOrDeleteFavoritesResponseMapper on AddOrDeleteFavoritesResponse? {
  AddOrDeleteFavoritesModel toDomain() {
    return AddOrDeleteFavoritesModel(
      this!.data.toDomain(),
    );
  }
}

extension CartProductResponseMapper on CartProductResponse? {
  CartProductModel toDomain() {
    return CartProductModel(
      this?.id.orZero() ?? Constants.zero,
      this?.price.orDouble() ?? Constants.isDouble,
      this?.oldPrice.orDouble() ?? Constants.isDouble,
      this?.discount.orDouble() ?? Constants.isDouble,
      this?.image.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
      this?.images.orList() ?? Constants.stringsList,
      this?.inFavorites.orFalse() ?? Constants.boolFalse,
      this?.inCart.orFalse() ?? Constants.boolFalse,
    );
  }
}

extension CartItemsResponseMapper on CartItemsResponse? {
  CartItemsModel toDomain() {
    //  List<CartProductModel> product = (this?.product?.map(
    //             (cartProductResponse) => cartProductResponse.toDomain()) ??
    //         const Iterable.empty().cast<CartProductModel>())
    //     .toList();
    return CartItemsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.quantity.orZero() ?? Constants.zero,
      this?.product.toDomain(),
    );
  }
}

extension CartResponseMapper on CartResponse? {
  CartModel toDomain() {
    List<CartItemsModel> cartItems = (this
                ?.data
                ?.cartItems
                ?.map((cartItemsResponse) => cartItemsResponse.toDomain()) ??
            const Iterable.empty().cast<CartItemsModel>())
        .toList();
    double subTotal = this?.data?.subTotal.orDouble() ?? Constants.isDouble;
    double total = this?.data?.total.orDouble() ?? Constants.isDouble;
    var data = CartDataModel(
      cartItems,
      subTotal,
      total,
    );
    return CartModel(data);
  }
}

extension AddOrDeleteCartProductResponseMapper
    on AddOrDeleteCartProductResponse? {
  AddOrDeleteCartProductModel toDomain() {
    return AddOrDeleteCartProductModel(
      this?.id.orZero() ?? Constants.zero,
      this?.price.orDouble() ?? Constants.isDouble,
      this?.oldPrice.orDouble() ?? Constants.isDouble,
      this?.discount.orDouble() ?? Constants.isDouble,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension AddOrDeleteCartDataResponseMapper on AddOrDeleteCartDataResponse? {
  AddOrDeleteCartDataModel toDomain() {
    return AddOrDeleteCartDataModel(
      this?.id.orZero() ?? Constants.zero,
      this?.product.toDomain(),
    );
  }
}

extension AddOrDeleteCartResponseMapper on AddOrDeleteCartResponse? {
  AddOrDeleteCartModel toDomain() {
    return AddOrDeleteCartModel(this?.data.toDomain());
  }
}

// -- Profile Mapper

extension ProfileDataResponseMapper on ProfileDataResponse? {
  ProfileDataModel toDomain() {
    return ProfileDataModel(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.phone.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
      this?.points.orZero() ?? Constants.zero,
      this?.credit.orDouble() ?? Constants.isDouble,
      this?.token.orEmpty() ?? Constants.empty,
    );
  }
}

extension ProfileResponseMapper on ProfileResponse? {
  ProfileModel toDomain() {
    return ProfileModel(this?.data.toDomain());
  }
}

//-- Search Mapper
extension SearchProductResponseMapper on SearchProductResponse? {
  SearchProductModel toDomain() {
    return SearchProductModel(
      this?.id.orZero() ?? Constants.zero,
      this?.price.orDouble() ?? Constants.isDouble,
      this?.image.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
      this?.images.orList() ?? Constants.stringsList,
      this?.inFavorites.orFalse() ?? Constants.boolFalse,
      this?.inCart.orFalse() ?? Constants.boolFalse,
    );
  }
}

extension SearchDataResponseMapper on SearchDataResponse? {
  SearchDataModel toDomain() {
    List<SearchProductModel> data = (this?.data?.map(
                (searchProductResponse) => searchProductResponse.toDomain()) ??
            const Iterable.empty().cast<SearchProductModel>())
        .toList();
    return SearchDataModel(
      this?.currentPage.orZero() ?? Constants.zero,
      data,
      this?.firstPageUrl.orEmpty() ?? Constants.empty,
      this?.from.orZero() ?? Constants.zero,
      this?.lastPage.orZero() ?? Constants.zero,
      this?.lastPageUrl.orEmpty() ?? Constants.empty,
      this?.nextPageUrl.orEmpty() ?? Constants.empty,
      this?.path.orEmpty() ?? Constants.empty,
      this?.perPage.orZero() ?? Constants.zero,
      this?.prevPageUrl.orEmpty() ?? Constants.empty,
      this?.to.orZero() ?? Constants.zero,
      this?.total.orZero() ?? Constants.zero,
    );
  }
}

extension SearchResponseMapper on SearchResponse? {
  SearchModel toDomain() {
    return SearchModel(this?.data.toDomain());
  }
}

//-- Logout Mapper
extension LogoutDataResponseMapper on LogoutDataResponse? {
  LogoutDataModel toDomain() {
    return LogoutDataModel(
      this?.id.orZero() ?? Constants.zero,
      this?.token.orEmpty() ?? Constants.empty,
    );
  }
}

extension LogoutResponseMapper on LogoutResponse? {
  LogoutModel toDomain() {
    return LogoutModel(this?.data.toDomain());
  }
}
