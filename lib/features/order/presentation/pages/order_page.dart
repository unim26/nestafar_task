import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/utils/widgets/app_loading_indicator.dart';
import 'package:nestafar_task/core/utils/widgets/app_snacbar.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/order/domain/entities/order_entity.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_state.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          //loading state
          if (state is OrderLoadingState) {
            return AppLoadingIndicator(
              message: 'getting your order history...',
            );
          } else if (state.orders == null || state.orders!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text('No orders found.'),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(10),
            itemCount: state.orders!.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) {
              final food = state.orders![index].item;
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
                    Text(
                      state.orders![index].time.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor(
                          state.orders![index].status,
                        ).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        state.orders![index].status.toString().split('.').last,
                        style: TextStyle(
                          color: statusColor(state.orders![index].status),
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
