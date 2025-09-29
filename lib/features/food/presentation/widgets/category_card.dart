import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_bloc.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_event.dart';

class CategoryCard extends StatefulWidget {
  CategoryCard({super.key, required this.categories});

  final List<String> categories;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  String? selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final Size sSize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: sSize.height * .08,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: widget.categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.categories[index] == 'All'
                  ? context.read<FoodBloc>().add(GetFoodsEvent())
                  : context.read<FoodBloc>().add(
                      GetFoodByCategoryEvent(
                        category: widget.categories[index],
                      ),
                    );

              setState(() {
                selectedCategory = widget.categories[index];
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: selectedCategory == widget.categories[index]
                  ? Colors.blue
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                child: Text(
                  widget.categories[index],
                  style: TextStyle(
                    color: selectedCategory == widget.categories[index]
                        ? Colors.white
                        : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
