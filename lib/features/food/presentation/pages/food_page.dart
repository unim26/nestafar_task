import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/utils/widgets/app_loading_indicator.dart';
import 'package:nestafar_task/core/utils/widgets/app_snacbar.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_bloc.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_event.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_state.dart';
import 'package:nestafar_task/features/food/presentation/widgets/category_card.dart';
import 'package:nestafar_task/features/food/presentation/widgets/food_card.dart';


class FoodPage extends StatefulWidget {
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {


  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      //fetch food items
      BlocProvider.of<FoodBloc>(context).add(GetFoodsEvent());
      //fetch cart iteams
      context.read<CartBloc>().add(GetCartItemsEvent());
    });
    print('calling get foods');
    super.initState();
  }

  //build
  @override
  Widget build(BuildContext context) {
    final categories = [
      "All",
      "Snacks",
      "Dessert",
      "Drinks",
      "Main Course",
      "Starter",
      "Salad",
      "Others",
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: BlocConsumer<FoodBloc, FoodState>(
        listener: (context, state) {
          //success state
          if (state is FoodSuccessState) {
            //
          }

          //error state
          if (state is FoodErrorstate) {
            //message
            appSnacBar(context, message: state.errorMessage, type: 'error');
          }
        },
        builder: (context, state) {
          print('building food page  with state: $state');
          if (state is FoodLoadingState) {
            return AppLoadingIndicator(message: 'Getting available food');
          } else if (state is FoodErrorstate) {
            return Center(
              child: Text('Something went wrong please try after sometime'),
            );
          }else if (state is FoodSuccessState && state.foods!.isEmpty) {
            return Center(
              child: Text('No food available'),
            );
          } else if (state is! FoodSuccessState) {
            return Center(
              child: Text('No food available'),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Cards
              CategoryCard(categories: categories),

              // Food Grid
              FoodCard(foods: state.foods!),
            ],
          );
        },
      ),
    );
  }
}
