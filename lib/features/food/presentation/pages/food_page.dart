import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/utils/widgets/app_loading_indicator.dart';
import 'package:nestafar_task/core/utils/widgets/app_snacbar.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
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
    context.read<FoodBloc>().add(GetFoodsEvent());
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
      appBar: AppBar(title: Text('Categories')),
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
          if (state is FoodLoadingState) {
            return AppLoadingIndicator(message: 'Getting available food');
          } else if (state is FoodErrorstate) {
            return Center(
              child: Text('Something went wrong please try after sometime'),
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
