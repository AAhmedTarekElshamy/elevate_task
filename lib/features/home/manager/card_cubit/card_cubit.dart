
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositry/home_repo.dart';
import 'card_cubit_states.dart';

class CardCubit extends Cubit<CardCubitStates>{
  CardCubit( {required this.homeRepo}):  super(CardInitial()) ;
  final HomeRepo homeRepo;
  bool isFav=false;

  Future<void> fetchCards() async{
    emit(CardLoading());
    var result  =await  homeRepo.fetchCardData() ;
    result.fold((failure) {
      emit(CardFailure(errorMsg:failure.errorMsg
      ));
    }, (cards) {
      emit(CardSuccess( cards: cards));


    });
  }
}