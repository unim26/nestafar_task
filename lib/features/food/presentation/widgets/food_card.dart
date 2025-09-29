import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/utils/widgets/app_button.dart';
import 'package:nestafar_task/core/utils/widgets/app_loading_indicator.dart';
import 'package:nestafar_task/core/utils/widgets/app_snacbar.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foods});

  final List<FoodModel> foods;

  @override
  Widget build(BuildContext context) {
    //function to adding food to cart
    void addToCart(FoodModel food) {
      context.read<CartBloc>().add(AddToCartEvent(food: food));
    }

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        //success state
        if (state is CartSuccessState && state.response == true) {
          //show message
          appSnacBar(
            context,
            message: 'item is Added to cart',
            type: 'success',
          );
        }

        //error state
        if (state is CartErrorState) {
          //show message
          appSnacBar(context, message: state.errorMessage, type: 'error');
        }
      },
      builder: (context, state) {
        return Expanded(
          child: foods.isEmpty
              ? Center(child: Text('No food items in this category.'))
              : GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  food.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              food.name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                SizedBox(width: 3),
                                Text('${food.rating}'),
                                Spacer(),
                                Text(
                                  '₹${food.price}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            SizedBox(
                              width: double.infinity,
                              child:
                                  state.cartItems != null &&
                                      state.cartItems!.any(
                                        (item) => item.id == food.id,
                                      )
                                  ? Text('Added to cart')
                                  : state is CartLoadingState
                                  ? CircularProgressIndicator()
                                  : AppButton(
                                      title: 'Add to Cart',
                                      onPressed: () => addToCart(food),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
