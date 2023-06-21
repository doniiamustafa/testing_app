import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:testing_app/core/app_service_client.dart';
import 'package:testing_app/core/dio_factory.dart';
import 'package:testing_app/features/home/data/datasource/remote_data_source_impl.dart';
import 'package:testing_app/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:testing_app/features/home/domain/usecase/home_usecases.dart';
import 'package:testing_app/features/home/presentation/bloc/home_bloc.dart';

final instance = GetIt.instance;

Future<void> initApp() async {
  log("initApp");
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app service client
  Dio dio = await instance<DioFactory>().getDio();

  if (!GetIt.I.isRegistered<AppServiceClient>()) {
    instance.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(dio),
    );
  }

 
}

initHome() {
  log("initHome");

  // data source
  if (!GetIt.I.isRegistered<HomeRemoteDataSourceImpl>()) {
    instance.registerLazySingleton<HomeRemoteDataSourceImpl>(
      () => HomeRemoteDataSourceImpl(instance<AppServiceClient>()),
    );
  }

  // repository
  if (!GetIt.I.isRegistered<HomeRepositoryImpl>()) {
    instance.registerLazySingleton<HomeRepositoryImpl>(
      () => HomeRepositoryImpl(
        instance<HomeRemoteDataSourceImpl>(),
      ),
    );
  }

  // usecases
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(
      () => HomeUseCase(
        instance<HomeRepositoryImpl>(),
      ),
    );
  }
  
   //bloc
  if (!GetIt.I.isRegistered<HomeBloc>()) {
    instance.registerFactory<HomeBloc>(
      () => HomeBloc(
        homeUseCase: instance<HomeUseCase>(),
      ),
    );
  }
}
