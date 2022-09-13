import 'package:soq_app/data/network/app_api.dart';
import 'package:soq_app/data/network/requstes.dart';
import 'package:soq_app/data/responses/responses.dart';

abstract class ReomteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<RegisterAuthenticationResponse> register(
      RegisterRequest registerRequest);
  Future<HomeResponse> home();
  Future<FavoritesResponse> getFavorites();
  Future<AddOrDeleteFavoritesResponse> addOrDeleteFavorites(
      FavoritesRequest favoritesRequest);
  Future<CartResponse> getCart();
  Future<AddOrDeleteCartResponse> addOrDeleteCart(CartRequest cartRequest);
  Future<AuthenticationResponse> getProfile();
  Future<AuthenticationResponse> updateProfile(
      UpdateProfileRequest updateProfileRequest);
  Future<SearchResponse> getSearch(SearchRequest searchRequest);
  Future<LogoutResponse> logout(LogoutRequest logoutRequest);
}

class ReomteDataSourceImpl implements ReomteDataSource {
  final AppServiceClient _appServiceClient;
  ReomteDataSourceImpl(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<RegisterAuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
      registerRequest.name,
      registerRequest.phone,
      registerRequest.email,
      registerRequest.password,
      registerRequest.image,
    );
  }

  @override
  Future<HomeResponse> home() async {
    return await _appServiceClient.home();
  }

  @override
  Future<FavoritesResponse> getFavorites() async {
    return await _appServiceClient.getFavorites();
  }

  @override
  Future<AddOrDeleteFavoritesResponse> addOrDeleteFavorites(
      FavoritesRequest favoritesRequest) async {
    return await _appServiceClient
        .addOrDeleteFavorites(favoritesRequest.productId);
  }

  @override
  Future<CartResponse> getCart() async {
    return await _appServiceClient.getCart();
  }

  @override
  Future<AddOrDeleteCartResponse> addOrDeleteCart(
      CartRequest cartRequest) async {
    return await _appServiceClient.addOrDeleteCart(cartRequest.productId);
  }

  @override
  Future<AuthenticationResponse> getProfile() async {
    return await _appServiceClient.getProfile();
  }

  @override
  Future<AuthenticationResponse> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    return await _appServiceClient.updateProfile(
      updateProfileRequest.name,
      updateProfileRequest.phone,
      updateProfileRequest.email,
      updateProfileRequest.password,
      updateProfileRequest.image,
    );
  }

  @override
  Future<SearchResponse> getSearch(SearchRequest searchRequest) async {
    return await _appServiceClient.getSearch(searchRequest.text);
  }

  @override
  Future<LogoutResponse> logout(LogoutRequest logoutRequest) async {
    return await _appServiceClient.logout(logoutRequest.fcmToken);
  }
}
