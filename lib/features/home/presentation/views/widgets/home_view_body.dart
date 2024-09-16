import 'package:elevate_task/features/home/presentation/views/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/widgets/custom_error_message.dart';
import '../../../../../core/errors/widgets/custom_loading_indicator.dart';
import '../../../manager/card_cubit/card_cubit.dart';
import '../../../manager/card_cubit/card_cubit_states.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CardCubit,CardCubitStates>(
      builder: (context, state) {
        if (state is CardSuccess){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 8.0,
              childAspectRatio:3/4, // As

            ),
            itemCount: state.cards.length, // Number of items
            itemBuilder: (context, index) {
              return  ProductCard(cardModel: state.cards[index], favColor:BlocProvider.of<CardCubit>(context).isFav ,);
              //const CustomGridItem();
            },
          ),
        );
        }else if (state is CardFailure){
        return  CustomErrorMsg(
            errorMsg: state.errorMsg,
          );
        }else if(state is CardLoading) {
          return const CustomLoadingIndicator();
        }else {
          return const Center(child: Text('Unknown state'));
        }
      },

    );
  }
}
