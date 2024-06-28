

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lilac_mvvm_user/common/network/dio_client.dart';
import 'package:lilac_mvvm_user/data/api/user/user_api.dart';
import 'package:lilac_mvvm_user/repository/user/user_repository.dart';
import 'package:lilac_mvvm_user/viewmodel/user/controller/user_controller.dart';

final getIt = GetIt.instance;


Future<void> init() async{
  getIt.registerLazySingleton<Dio>(()=> Dio());
  getIt.registerLazySingleton<DioClient>(()=> DioClient(getIt<Dio>()));

  //user api
  getIt.registerLazySingleton<UserApi>(()=> UserApi(dioClient: getIt<DioClient>()));
  //user repository
  getIt.registerLazySingleton<UserRepository>(()=>UserRepository(userApi: getIt<UserApi>()));
  //user controller
  getIt.registerFactory(()=>UserController(userRepository: getIt<UserRepository>()));

}