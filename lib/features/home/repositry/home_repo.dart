

import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../data/models/card_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<CardModel>>> fetchCardData();

}
