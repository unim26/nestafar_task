import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/order/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.item,
    required super.time,
    required super.totalPrice,
    required super.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      item: json['item'],
      totalPrice: json['totalPrice']?.toDouble() ?? 0.0,
      time: DateTime.parse(json['time']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item': item,
      'totalPrice': totalPrice,
      'status': status,
      'time': time.toIso8601String(),
    };
  }
}
