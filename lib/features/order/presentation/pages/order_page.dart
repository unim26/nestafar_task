import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/utils/widgets/app_loading_indicator.dart';
import 'package:nestafar_task/core/utils/widgets/app_snacbar.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/order/domain/entities/order_entity.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_state.dart';

class OrdersPage extends StatelessWidget {
  Color statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Orders")),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          //order success state
          if (state is OrderSuccessState) {
            //show message
            appSnacBar(
              context,
              message: 'Order place successfully.',
              type: 'success',
            );
          }

          //error state
          if (state is OrderErrorState) {
            appSnacBar(context, message: state.message, type: 'error');
          }
        },
        builder: (context, state) {
          //loading state
          if (state is OrderLoadingState) {
            return AppLoadingIndicator(
              message: 'getting your order history...',
            );
          } else if (state.orders == null || state.orders!.isEmpty) {
            return Center(child: Text('No orders found.'));
          }

          final allFoods = <FoodModel>[];
          for (var order in state.orders!) {
            allFoods.addAll(order.items);
          }

          return ListView.separated(
            padding: EdgeInsets.all(10),
            itemCount: allFoods.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) {
              final food = allFoods[index];
              return ListTile(
                leading: Image.asset(
                  food.image!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(food.name!),
                subtitle: Text('₹${food.price}'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.orders![index].time.toString(), style: TextStyle(fontSize: 12)),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor(state.orders![index].status).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        state.orders![index].status.toString().split('.').last,
                        style: TextStyle(
                          color: statusColor(state.orders![index].status).withValues(alpha: .15),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
