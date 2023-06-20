import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<void, List<Map<String, dynamic>>>> getData();
}
