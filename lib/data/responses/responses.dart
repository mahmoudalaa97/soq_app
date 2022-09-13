// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
}

// -- Login Response
@JsonSerializable()
class DataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "points")
  int? points;
  @JsonKey(name: "credit")
  int? credit;

  DataResponse(this.id, this.name, this.email, this.phone, this.image,
      this.token, this.points, this.credit);

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "data")
  DataResponse? data;
  AuthenticationResponse(this.data);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

// -- Register Response
@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "token")
  String? token;

  RegisterResponse(
      this.id, this.name, this.email, this.phone, this.image, this.token);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class RegisterAuthenticationResponse extends BaseResponse {
  @JsonKey(name: "data")
  RegisterResponse? data;
  RegisterAuthenticationResponse(this.data);

  factory RegisterAuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterAuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAuthenticationResponseToJson(this);
}

// -- Home Response
@JsonSerializable()
class BannersResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "image")
  String? image;
  BannersResponse(this.id, this.image);
  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "in_favorites")
  bool? inFavorites;
  @JsonKey(name: "in_cart")
  bool? inCart;
  ProductsResponse(this.id, this.price, this.oldPrice, this.discount,
      this.image, this.name, this.description, this.inFavorites, this.inCart);
  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: "banners")
  List<BannersResponse>? banners;
  @JsonKey(name: "products")
  List<ProductsResponse>? products;
  HomeDataResponse(this.banners, this.products);

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: "data")
  HomeDataResponse? data;
  HomeResponse(this.data);

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

//-- Favorites Response
@JsonSerializable()
class FavoritesProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  FavoritesProductResponse(this.id, this.price, this.oldPrice, this.discount,
      this.image, this.name, this.description);

  factory FavoritesProductResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesProductResponseToJson(this);
}

@JsonSerializable()
class FavoritesProductDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product")
  FavoritesProductResponse? product;

  FavoritesProductDataResponse(this.id, this.product);

  factory FavoritesProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesProductDataResponseToJson(this);
}

@JsonSerializable()
class FavoritesDataResponse {
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "data")
  List<FavoritesProductDataResponse>? data;
  @JsonKey(name: "first_page_url")
  String? firstPageUrl;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "last_page_url")
  String? lastPageUrl;
  @JsonKey(name: "next_page_url")
  String? nextPageUrl;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "prev_page_url")
  String? prevPageUrl;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int? total;

  FavoritesDataResponse(
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total);

  factory FavoritesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesDataResponseToJson(this);
}

@JsonSerializable()
class FavoritesResponse extends BaseResponse {
  @JsonKey(name: "data")
  FavoritesDataResponse? data;

  FavoritesResponse(this.data);

  factory FavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesResponseToJson(this);
}

@JsonSerializable()
class AddOrDeleteFavoritesProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;

  AddOrDeleteFavoritesProductResponse(
      this.id, this.price, this.oldPrice, this.discount, this.image);

  factory AddOrDeleteFavoritesProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddOrDeleteFavoritesProductResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddOrDeleteFavoritesProductResponseToJson(this);
}

@JsonSerializable()
class AddOrDeleteFavoritesProductDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product")
  AddOrDeleteFavoritesProductResponse? product;

  AddOrDeleteFavoritesProductDataResponse(this.id, this.product);

  factory AddOrDeleteFavoritesProductDataResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddOrDeleteFavoritesProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddOrDeleteFavoritesProductDataResponseToJson(this);
}

@JsonSerializable()
class AddOrDeleteFavoritesResponse extends BaseResponse {
  @JsonKey(name: "data")
  AddOrDeleteFavoritesProductDataResponse? data;

  AddOrDeleteFavoritesResponse(this.data);

  factory AddOrDeleteFavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$AddOrDeleteFavoritesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrDeleteFavoritesResponseToJson(this);
}

//-- Cart Response
@JsonSerializable()
class CartProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "in_favorites")
  bool? inFavorites;
  @JsonKey(name: "in_cart")
  bool? inCart;
  CartProductResponse(
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  );

  factory CartProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CartProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductResponseToJson(this);
}

@JsonSerializable()
class CartItemsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "product")
  CartProductResponse? product;

  CartItemsResponse(this.id, this.quantity, this.product);

  factory CartItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsResponseToJson(this);
}

@JsonSerializable()
class CartDataResponse {
  @JsonKey(name: "cart_items")
  List<CartItemsResponse>? cartItems;
  @JsonKey(name: "sub_total")
  double? subTotal;
  @JsonKey(name: "total")
  double? total;

  CartDataResponse(this.cartItems, this.subTotal, this.total);

  factory CartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CartDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataResponseToJson(this);
}

@JsonSerializable()
class CartResponse extends BaseResponse {
  @JsonKey(name: "data")
  CartDataResponse? data;

  CartResponse(this.data);

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}

@JsonSerializable()
class AddOrDeleteCartProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  @JsonKey(name: "discount")
  double? discount;
  @JsonKey(name: "image")
  String? image;

  AddOrDeleteCartProductResponse(
      this.id, this.price, this.oldPrice, this.discount, this.image);

  factory AddOrDeleteCartProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AddOrDeleteCartProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrDeleteCartProductResponseToJson(this);
}

@JsonSerializable()
class AddOrDeleteCartDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product")
  AddOrDeleteCartProductResponse? product;

  AddOrDeleteCartDataResponse(this.id, this.product);

  factory AddOrDeleteCartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddOrDeleteCartDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrDeleteCartDataResponseToJson(this);
}

@JsonSerializable()
class AddOrDeleteCartResponse extends BaseResponse {
  @JsonKey(name: "data")
  AddOrDeleteCartDataResponse? data;

  AddOrDeleteCartResponse(this.data);

  factory AddOrDeleteCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddOrDeleteCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrDeleteCartResponseToJson(this);
}

//-- Profile Response
@JsonSerializable()
class ProfileDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "points")
  int? points;
  @JsonKey(name: "credit")
  double? credit;
  @JsonKey(name: "token")
  String? token;

  ProfileDataResponse(this.id, this.name, this.email, this.phone, this.image,
      this.points, this.credit, this.token);

  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataResponseToJson(this);
}

@JsonSerializable()
class ProfileResponse extends BaseResponse {
  @JsonKey(name: "data")
  ProfileDataResponse? data;

  ProfileResponse(this.data);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

//-- Search Response
@JsonSerializable()
class SearchProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "in_favorites")
  bool? inFavorites;
  @JsonKey(name: "in_cart")
  bool? inCart;
  SearchProductResponse(
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  );

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductResponseToJson(this);
}

@JsonSerializable()
class SearchDataResponse {
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "data")
  List<SearchProductResponse>? data;
  @JsonKey(name: "first_page_url")
  String? firstPageUrl;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "last_page_url")
  String? lastPageUrl;
  @JsonKey(name: "next_page_url")
  String? nextPageUrl;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "prev_page_url")
  String? prevPageUrl;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int? total;

  SearchDataResponse(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );

  factory SearchDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataResponseToJson(this);
}

@JsonSerializable()
class SearchResponse extends BaseResponse {
  @JsonKey(name: "data")
  SearchDataResponse? data;

  SearchResponse(this.data);

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

//-- Logout
@JsonSerializable()
class LogoutDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "token")
  String? token;

  LogoutDataResponse(this.id, this.token);

  factory LogoutDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutDataResponseToJson(this);
}

@JsonSerializable()
class LogoutResponse extends BaseResponse {
  @JsonKey(name: "data")
  LogoutDataResponse? data;

  LogoutResponse(this.data);

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
