import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item});

  final FoodModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Image.asset(item.image!, width: 50, height: 50),
        title: Text(item.name!),
        subtitle: Text('₹${item.price}'),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline, color: Colors.red),
          onPressed: () {
            context.read<CartBloc>().add(RemoveFromCartEvent(foodId: item.id!));
          },
        ),
      ),
    );
  }
}
