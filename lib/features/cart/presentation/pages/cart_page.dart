import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/utils/widgets/app_loading_indicator.dart';
import 'package:nestafar_task/core/utils/widgets/app_snacbar.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:nestafar_task/features/cart/presentation/widgets/cart_iteam_card.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/order/data/model/order_model.dart';
import 'package:nestafar_task/features/order/domain/entities/order_entity.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_event.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //variable
  int totalPrice = 0;
  List<FoodModel> cartIteams = [];
  @override
  void initState() {
    context.read<CartBloc>().add(GetCartItemsEvent());
    super.initState();
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          //success state
          if (state is CartSuccessState) {
            cartIteams = state.cartItems!;
            //calculate total price
            totalPrice = state.cartItems!.fold(
              0,
              (sum, item) => sum + (item.price as int),
            );
          }

          //error state
          if (state is CartErrorState) {
            //message
            appSnacBar(context, message: state.errorMessage, type: 'error');
          }
        },
        builder: (context, state) {
          print('building cart page with state: $state');
          if (state is CartLoadingState) {
            return AppLoadingIndicator(message: 'Getting your cart details...');
          } else if (state is CartErrorState) {
            return Center(
              child: Text('Something went wrong please try after sometime'),
            );
          } else if (state is CartSuccessState && state.cartItems!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text('Your cart is empty'),
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //cart iteams
              Expanded(
                child: ListView.builder(
                  itemCount: state.cartItems!.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    final item = state.cartItems![index];
                    return CartItemCard(item: item);
                  },
                ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Total: ₹$totalPrice",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (cartIteams.isEmpty) {
                  appSnacBar(
                    context,
                    message: 'Your cart is empty',
                    type: 'warning',
                  );
                  return;
                }
                //order now
                context.read<OrderBloc>().add(
                  PlaceOrderEvent(
                    order: OrderModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      items: cartIteams,
                      time: DateTime.now(),
                      totalPrice: totalPrice.toDouble(),
                      status: OrderStatus.pending,
                    ),
                  ),
                );
              },
              child: Text("Order Now"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
