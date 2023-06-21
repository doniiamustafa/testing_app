import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:testing_app/features/home/data/datasource/datasource.dart';
import 'package:testing_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImpl(this.homeDataSource);
  @override
  Future<Either<void, List<Map<String, dynamic>>>> getData() async {
    try {
      final response = await homeDataSource.getData();
      return Right(response.data);
    } catch (e) {
      log(e.toString());
      return const Left("Not found");
    }
  }
}
