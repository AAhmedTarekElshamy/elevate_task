import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  ApiService({required this.dio});
  final Dio dio  ;
  String baseUrl = 'https://fakestoreapi.com/products/';
  Future<List<dynamic>>  getCardData() async {
    var response = await dio.get(baseUrl);

       print( response.data);

    return response.data;
  }
}
