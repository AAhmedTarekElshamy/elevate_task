
import 'package:elevate_task/features/home/presentation/views/widgets/custom_grid_item.dart';
import 'package:elevate_task/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:elevate_task/features/home/presentation/views/widgets/product_cart.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white60,
        body: HomeViewBody(),
    );
  }
}




