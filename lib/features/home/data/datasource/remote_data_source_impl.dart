import 'package:testing_app/core/app_service_client.dart';
import 'package:testing_app/features/home/data/datasource/datasource.dart';
import 'package:testing_app/features/home/data/network/home_response.dart';

class HomeRemoteDataSourceImpl implements HomeDataSource {
  final AppServiceClient _appServiceClient;
  HomeRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<HomeResponse> getData() async {
    return await _appServiceClient.getHomeScreenData();
  }
}
