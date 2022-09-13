class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String name;
  String email;
  String phone;
  String image =
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-29ce0.appspot.com/o/businessman-character-avatar-isolated_24877-60111.webp?alt=media&token=7d0013ba-d679-4d7d-b12c-f9b21ce7e7f8";

  String password;

  RegisterRequest(this.name, this.email, this.phone, this.password);
}

class FavoritesRequest {
  int productId;
  FavoritesRequest(this.productId);
}

class CartRequest {
  int productId;
  CartRequest(this.productId);
}

class UpdateProfileRequest {
  String name;
  String phone;
  String email;
  String password;
  String image =
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-29ce0.appspot.com/o/businessman-character-avatar-isolated_24877-60111.webp?alt=media&token=7d0013ba-d679-4d7d-b12c-f9b21ce7e7f8";

  UpdateProfileRequest(this.name, this.email, this.phone, this.password);
}

class SearchRequest {
  String text;
  SearchRequest(this.text);
}

class LogoutRequest {
  String fcmToken;
  LogoutRequest(this.fcmToken);
}
