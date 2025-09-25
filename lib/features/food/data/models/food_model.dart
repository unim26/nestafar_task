import 'package:nestafar_task/features/food/domain/entities/food_entity.dart';

class FoodModel extends FoodEntity {
  const FoodModel({
    super.name,
    super.rating,
    super.category,
    super.price,
    super.isVeg,
    super.image,
    super.id,
    super.quantity,
  });

  //from json
  factory FoodModel.fromJson(Map<String, dynamic> json)
    => FoodModel(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: json['rating'] as double,
      category: json['category'] as String,
      price: json['price'] as int,
      isVeg: json['isVeg'] as bool,
      image: json['image'] as String,
      quantity: json['quantity'] ?? 0,
    );
}
