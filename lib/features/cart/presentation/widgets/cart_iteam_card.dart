import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/utils/widgets/app_snacbar.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_state.dart';

class CartItemCard extends StatelessWidget {
   CartItemCard({super.key, required this.item});

  final FoodModel item;
  bool isRemoveFromCart = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccessState && isRemoveFromCart) {
          appSnacBar(
            context,
            message: 'Item removed from cart',
            type: 'success',
          );
          isRemoveFromCart = false;
        }
      },
      builder: (context, state) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: Image.asset(item.image!, width: 50, height: 50),
            title: Text(item.name!),
            subtitle: Text('₹${item.price}'),
            trailing: IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                context.read<CartBloc>().add(
                  RemoveFromCartEvent(foodId: item.id!),
                );
                isRemoveFromCart = true;
              },
            ),
          ),
        );
      },
    );
  }
}
