//  Bottom Navigation Widget
import 'package:flutter/material.dart';
import 'package:nestafar_task/features/cart/presentation/pages/cart_page.dart';
import 'package:nestafar_task/features/food/presentation/pages/food_page.dart';
import 'package:nestafar_task/features/order/presentation/pages/order_page.dart';

class NavigationPage extends StatefulWidget {
  State<NavigationPage> createState() => _NavigationPageState();
}



class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FoodPage(),
    // Restaurantpages(),
    OrdersPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.restaurant),
          //   label: 'Restaurants',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
