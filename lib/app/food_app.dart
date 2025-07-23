import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/config/routes/app_router.dart';
import 'package:food_app/features/cart/presentation/cubit/cart_cubit.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CartCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        initialRoute: AppRouter.splash,
      ),
    );
  }
}
