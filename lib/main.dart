import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utility/service_locator.dart';
import 'features/home/manager/card_cubit/card_cubit.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/home/repositry/home_repo_implement.dart';


void main() {

  setupGetIt(); // Ensure that the service locator is set up before running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardCubit(homeRepo: getIt.get<HomeRepoImp>())..fetchCards(), // Initialize CardCubit with repository
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
