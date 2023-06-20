import 'package:testing_app/features/home/data/network/home_response.dart';

abstract class HomeDataSource {
  Future<HomeResponse> getData();
}
