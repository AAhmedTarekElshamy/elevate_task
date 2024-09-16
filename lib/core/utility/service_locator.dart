

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/repositry/home_repo_implement.dart';
import 'api_service.dart';




final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));                                                                                                                                                                                                                                                                                                                                                                    // Alternatively you could write it if you don't like global variables
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(apiService:getIt.get<ApiService>() ));
}