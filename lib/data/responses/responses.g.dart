// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as bool?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['image'] as String?,
      json['token'] as String?,
      json['points'] as int?,
      json['credit'] as int?,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'token': instance.token,
      'points': instance.points,
      'credit': instance.credit,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['image'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'token': instance.token,
    };

RegisterAuthenticationResponse _$RegisterAuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterAuthenticationResponse(
      json['data'] == null
          ? null
          : RegisterResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RegisterAuthenticationResponseToJson(
        RegisterAuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      json['id'] as int?,
      json['image'] as String?,
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['in_favorites'] as bool?,
      json['in_cart'] as bool?,
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'products': instance.products,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FavoritesProductResponse _$FavoritesProductResponseFromJson(
        Map<String, dynamic> json) =>
    FavoritesProductResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
      json['name'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$FavoritesProductResponseToJson(
        FavoritesProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };

FavoritesProductDataResponse _$FavoritesProductDataResponseFromJson(
        Map<String, dynamic> json) =>
    FavoritesProductDataResponse(
      json['id'] as int?,
      json['product'] == null
          ? null
          : FavoritesProductResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesProductDataResponseToJson(
        FavoritesProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

FavoritesDataResponse _$FavoritesDataResponseFromJson(
        Map<String, dynamic> json) =>
    FavoritesDataResponse(
      json['current_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              FavoritesProductDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['last_page_url'] as String?,
      json['next_page_url'] as String?,
      json['path'] as String?,
      json['per_page'] as int?,
      json['prev_page_url'] as String?,
      json['to'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$FavoritesDataResponseToJson(
        FavoritesDataResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

FavoritesResponse _$FavoritesResponseFromJson(Map<String, dynamic> json) =>
    FavoritesResponse(
      json['data'] == null
          ? null
          : FavoritesDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$FavoritesResponseToJson(FavoritesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

AddOrDeleteFavoritesProductResponse
    _$AddOrDeleteFavoritesProductResponseFromJson(Map<String, dynamic> json) =>
        AddOrDeleteFavoritesProductResponse(
          json['id'] as int?,
          (json['price'] as num?)?.toDouble(),
          (json['old_price'] as num?)?.toDouble(),
          (json['discount'] as num?)?.toDouble(),
          json['image'] as String?,
        );

Map<String, dynamic> _$AddOrDeleteFavoritesProductResponseToJson(
        AddOrDeleteFavoritesProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };

AddOrDeleteFavoritesProductDataResponse
    _$AddOrDeleteFavoritesProductDataResponseFromJson(
            Map<String, dynamic> json) =>
        AddOrDeleteFavoritesProductDataResponse(
          json['id'] as int?,
          json['product'] == null
              ? null
              : AddOrDeleteFavoritesProductResponse.fromJson(
                  json['product'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$AddOrDeleteFavoritesProductDataResponseToJson(
        AddOrDeleteFavoritesProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

AddOrDeleteFavoritesResponse _$AddOrDeleteFavoritesResponseFromJson(
        Map<String, dynamic> json) =>
    AddOrDeleteFavoritesResponse(
      json['data'] == null
          ? null
          : AddOrDeleteFavoritesProductDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AddOrDeleteFavoritesResponseToJson(
        AddOrDeleteFavoritesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CartProductResponse _$CartProductResponseFromJson(Map<String, dynamic> json) =>
    CartProductResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['in_favorites'] as bool?,
      json['in_cart'] as bool?,
    );

Map<String, dynamic> _$CartProductResponseToJson(
        CartProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };

CartItemsResponse _$CartItemsResponseFromJson(Map<String, dynamic> json) =>
    CartItemsResponse(
      json['id'] as int?,
      json['quantity'] as int?,
      json['product'] == null
          ? null
          : CartProductResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemsResponseToJson(CartItemsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

CartDataResponse _$CartDataResponseFromJson(Map<String, dynamic> json) =>
    CartDataResponse(
      (json['cart_items'] as List<dynamic>?)
          ?.map((e) => CartItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sub_total'] as num?)?.toDouble(),
      (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CartDataResponseToJson(CartDataResponse instance) =>
    <String, dynamic>{
      'cart_items': instance.cartItems,
      'sub_total': instance.subTotal,
      'total': instance.total,
    };

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      json['data'] == null
          ? null
          : CartDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

AddOrDeleteCartProductResponse _$AddOrDeleteCartProductResponseFromJson(
        Map<String, dynamic> json) =>
    AddOrDeleteCartProductResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      (json['old_price'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['image'] as String?,
    );

Map<String, dynamic> _$AddOrDeleteCartProductResponseToJson(
        AddOrDeleteCartProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };

AddOrDeleteCartDataResponse _$AddOrDeleteCartDataResponseFromJson(
        Map<String, dynamic> json) =>
    AddOrDeleteCartDataResponse(
      json['id'] as int?,
      json['product'] == null
          ? null
          : AddOrDeleteCartProductResponse.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrDeleteCartDataResponseToJson(
        AddOrDeleteCartDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

AddOrDeleteCartResponse _$AddOrDeleteCartResponseFromJson(
        Map<String, dynamic> json) =>
    AddOrDeleteCartResponse(
      json['data'] == null
          ? null
          : AddOrDeleteCartDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AddOrDeleteCartResponseToJson(
        AddOrDeleteCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['image'] as String?,
      json['points'] as int?,
      (json['credit'] as num?)?.toDouble(),
      json['token'] as String?,
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'points': instance.points,
      'credit': instance.credit,
      'token': instance.token,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['data'] == null
          ? null
          : ProfileDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SearchProductResponse _$SearchProductResponseFromJson(
        Map<String, dynamic> json) =>
    SearchProductResponse(
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      json['image'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['in_favorites'] as bool?,
      json['in_cart'] as bool?,
    );

Map<String, dynamic> _$SearchProductResponseToJson(
        SearchProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };

SearchDataResponse _$SearchDataResponseFromJson(Map<String, dynamic> json) =>
    SearchDataResponse(
      json['current_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map(
              (e) => SearchProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['last_page_url'] as String?,
      json['next_page_url'] as String?,
      json['path'] as String?,
      json['per_page'] as int?,
      json['prev_page_url'] as String?,
      json['to'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$SearchDataResponseToJson(SearchDataResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      json['data'] == null
          ? null
          : SearchDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LogoutDataResponse _$LogoutDataResponseFromJson(Map<String, dynamic> json) =>
    LogoutDataResponse(
      json['id'] as int?,
      json['token'] as String?,
    );

Map<String, dynamic> _$LogoutDataResponseToJson(LogoutDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse(
      json['data'] == null
          ? null
          : LogoutDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
