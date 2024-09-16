import '../../data/models/card_model.dart';

abstract class CardCubitStates{}
class CardInitial  extends CardCubitStates{}
class CardLoading  extends CardCubitStates{}
class CardSuccess  extends CardCubitStates{
  final List<CardModel>cards;

  CardSuccess({required this.cards});
}
class CardFailure extends CardCubitStates{
  final String errorMsg;

  CardFailure({required this.errorMsg});
}
