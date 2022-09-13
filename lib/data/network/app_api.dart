import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:soq_app/app/constants.dart';
import 'package:soq_app/data/responses/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("register")
  Future<RegisterAuthenticationResponse> register(
    @Field("name") String name,
    @Field("phone") String phone,
    @Field("email") String email,
    @Field("password") String password,
    @Field("image") String image,
  );

  @GET("home")
  Future<HomeResponse> home();

  @GET("favorites")
  Future<FavoritesResponse> getFavorites();

  @POST("favorites")
  Future<AddOrDeleteFavoritesResponse> addOrDeleteFavorites(
    @Field("product_id") int productId,
  );

  @GET("carts")
  Future<CartResponse> getCart();

  @POST("carts")
  Future<AddOrDeleteCartResponse> addOrDeleteCart(
    @Field("product_id") int productId,
  );

  @GET("profile")
  Future<AuthenticationResponse> getProfile();
  @PUT("update-profile")
  Future<AuthenticationResponse> updateProfile(
    @Field("name") String name,
    @Field("phone") String phone,
    @Field("email") String email,
    @Field("password") String password,
    @Field("image") String image,
  );

  @POST("products/search")
  Future<SearchResponse> getSearch(
    @Field("text") String text,
  );

  @POST("logout")
  Future<LogoutResponse> logout(
    @Field("fcm_token") String fcmToken,
  );
}
