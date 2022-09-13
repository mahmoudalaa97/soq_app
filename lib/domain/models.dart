// -- OnBoarding Model

class OnBoardingModel {
  String title;
  String subTitle;
  String image;
  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

// -- Login Model

class AuthenticationData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;
  int points;
  int credit;

  AuthenticationData(this.id, this.name, this.email, this.phone, this.image,
      this.token, this.points, this.credit);
}

class Authentication {
  AuthenticationData? data;
  Authentication(this.data);
}

// -- Register Model
class RegisterAuthentication {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;

  RegisterAuthentication(
      this.id, this.name, this.email, this.phone, this.image, this.token);
}

class RegisterAuthenticationData {
  RegisterAuthentication? data;
  RegisterAuthenticationData(this.data);
}

// -- Home Model
class BannersModel {
  int id;
  String image;
  BannersModel(this.id, this.image);
}

class ProductsModel {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;
  bool inFavorites;
  bool inCart;
  ProductsModel(this.id, this.price, this.oldPrice, this.discount, this.image,
      this.name, this.description, this.inFavorites, this.inCart);
}

class HomeDataModel {
  List<BannersModel> banners;
  List<ProductsModel> products;
  HomeDataModel(this.banners, this.products);
}

class HomeModel {
  HomeDataModel? data;
  HomeModel(this.data);
}

// -- Favorites Model
class FavoritesProductModel {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;
  FavoritesProductModel(this.id, this.price, this.oldPrice, this.discount,
      this.image, this.name, this.description);
}

class FavoritesProductDataModel {
  int id;
  FavoritesProductModel product;
  FavoritesProductDataModel(this.id, this.product);
}

class FavoritesDataModel {
  int currentPage;
  List<FavoritesProductDataModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  String prevPageUrl;
  int to;
  int total;

  FavoritesDataModel(
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
}

class FavoritesModel {
  FavoritesDataModel? data;
  FavoritesModel(this.data);
}

class AddOrDeleteFavoritesProductModel {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;

  AddOrDeleteFavoritesProductModel(
      this.id, this.price, this.oldPrice, this.discount, this.image);
}

class AddOrDeleteFavoritesProductDataModel {
  int id;
  AddOrDeleteFavoritesProductModel product;

  AddOrDeleteFavoritesProductDataModel(this.id, this.product);
}

class AddOrDeleteFavoritesModel {
  AddOrDeleteFavoritesProductDataModel? data;

  AddOrDeleteFavoritesModel(this.data);
}

// -- Cart Model
class CartProductModel {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;
  CartProductModel(
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
}

class CartItemsModel {
  int id;
  int quantity;
  CartProductModel? product;

  CartItemsModel(this.id, this.quantity, this.product);
}

class CartDataModel {
  List<CartItemsModel> cartItems;
  double subTotal;
  double total;

  CartDataModel(this.cartItems, this.subTotal, this.total);
}

class CartModel {
  CartDataModel data;

  CartModel(this.data);
}

class AddOrDeleteCartProductModel {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;

  AddOrDeleteCartProductModel(
      this.id, this.price, this.oldPrice, this.discount, this.image);
}

class AddOrDeleteCartDataModel {
  int id;
  AddOrDeleteCartProductModel? product;

  AddOrDeleteCartDataModel(this.id, this.product);
}

class AddOrDeleteCartModel {
  AddOrDeleteCartDataModel? data;
  AddOrDeleteCartModel(this.data);
}

//-- Profile Model
class ProfileDataModel {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  double credit;
  String token;

  ProfileDataModel(this.id, this.name, this.email, this.phone, this.image,
      this.points, this.credit, this.token);
}

class ProfileModel {
  ProfileDataModel? data;

  ProfileModel(this.data);
}

//-- Search Model
class SearchProductModel {
  int id;
  double price;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;
  SearchProductModel(
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  );
}

class SearchDataModel {
  int currentPage;
  List<SearchProductModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  String prevPageUrl;
  int to;
  int total;

  SearchDataModel(
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
}

class SearchModel {
  SearchDataModel? data;

  SearchModel(this.data);
}

//-- Logout Model
class LogoutDataModel {
  int id;
  String token;

  LogoutDataModel(this.id, this.token);
}

class LogoutModel {
  LogoutDataModel? data;

  LogoutModel(this.data);
}
