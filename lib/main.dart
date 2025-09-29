import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nestafar_task/dependecy_injection.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_bloc.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_event.dart';
import 'package:nestafar_task/features/navigation/presentation/navigation_page.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //init loactor
  initLocator();

  //run app
  runApp(
    MultiBlocProvider(
      providers: [
        //order bloc
        BlocProvider(create: (context) => locator<OrderBloc>()),
        //food bloc
        BlocProvider(create: (context) => locator<FoodBloc>()),
        //cart bloc
        BlocProvider(create: (context) => locator<CartBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}
