
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate_task/core/errors/failures.dart';
import 'package:elevate_task/features/home/data/models/card_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utility/api_service.dart';
import 'home_repo.dart';
class HomeRepoImp extends HomeRepo {
  final ApiService apiService;

  HomeRepoImp({required this.apiService});





  @override
  Future<Either<Failure, List<CardModel>>> fetchCardData() async {
    try {

      List<dynamic> list =await apiService.getCardData() ;
      List<CardModel> categoriesList =[];
      for (int i =1;i<list.length;i++){
        categoriesList.add(CardModel.fromJson(list[i]));

      }
      return Right(categoriesList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.DioException(e));
      } else {
        return Left(ServerFailure(errorMsg: e.toString()));
      }
    }
  }
}

//   List<CardModel> cards = [];
// List data = (await apiService.getCardData()) as List ;
//
//
//    for (Map<String, dynamic> item in data.values ) {
//      cards.add(CardModel.fromJson(item));
//
// }//