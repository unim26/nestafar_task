import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final String? id;
  final String? name;
  final double? rating;
  final String? category;
  final int? price;
  final bool? isVeg;
  final String? image;
  final int? quantity;

  const FoodEntity({
    this.name,
    this.rating,
    this.category,
    this.price,
    this.isVeg,
    this.image,
    this.id,
    this.quantity,
  });

  @override
  List<Object?> get props => [id, name, rating, category, price, isVeg, image, quantity];
}
