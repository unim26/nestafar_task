import 'package:nestafar_task/features/food/data/models/food_model.dart';

class CartDataService {

  //list to store iteams in carts
  List<FoodModel> _cart = [];
  
  get retrun => null;

  //add to _cart
  bool addToCart(FoodModel foodModel)  {
    _cart.add(foodModel);

    return true;
  }


  //update cart
  bool updateCart(FoodModel foodModel)  {
    _cart.map((food)=>{
      if(food.id == foodModel.id){
        food = foodModel
      }
      
    });
    return true;
  }

  //get cart iteams
  List<FoodModel> getCart()  {
    return _cart;
  }


  //remove from cart
  bool removeFromCart(String foodid)  {
    _cart.map((food)=>{
      if(food.id == foodid){
        _cart.remove(food)
      }
      
    });
    return true;
  }
  
}