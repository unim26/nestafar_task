import 'package:equatable/equatable.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/food/domain/entities/food_entity.dart';

//order status enum
enum OrderStatus { pending, completed, canceled }

class OrderEntity extends Equatable{
  final String id;
  final List<FoodModel> items; // List of items in the order
  final double totalPrice; // Date and time when the order was placed
  final DateTime time;
  final OrderStatus
  status; // Status of the order (e.g., pending, completed, canceled)

  OrderEntity({
    required this.id,
    required this.items,
    required this.time,
    required this.totalPrice,
    required this.status,
  });

  @override
  List<Object?> get props => [id, items, totalPrice, time, status];
}
