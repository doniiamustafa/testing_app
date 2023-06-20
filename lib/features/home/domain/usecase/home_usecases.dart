import 'package:dartz/dartz.dart';
import 'package:testing_app/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;
  HomeUseCase(this._homeRepository);

  Future<Either<void, List<Map<String, dynamic>>>> call() async {
    return await _homeRepository.getData();
  }
}
