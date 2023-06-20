import 'package:dio/dio.dart';
import 'package:testing_app/config/app_constants.dart';
import 'package:testing_app/core/api_end_points.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testing_app/features/home/data/network/home_response.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(ApiEndPoints.homeScreenData)
  Future<HomeResponse> getHomeScreenData();
}
