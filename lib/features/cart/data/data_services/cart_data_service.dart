import 'package:nestafar_task/features/food/data/models/food_model.dart';

class CartDataService {

  //list to store iteams in carts
  List<FoodModel> cart = [];
  
  get retrun => null;

  //add to cart
  bool addToCart(FoodModel foodModel)  {
    cart.add(foodModel);

    return true;
  }


  //update cart
  bool updateCart(FoodModel foodModel)  {
    cart.map((food)=>{
      if(food.id == foodModel.id){
        food = foodModel
      }
      
    });
    return true;
  }

  //get cart iteams
  List<FoodModel> getCart()  {
    return cart;
  }


  //remove from cart
  bool removeFromCart(String foodid)  {
    cart.map((food)=>{
      if(food.id == foodid){
        cart.remove(food)
      }
      
    });
    return true;
  }
  
}