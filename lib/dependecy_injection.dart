//loaactor variable
import 'package:get_it/get_it.dart';
import 'package:nestafar_task/features/cart/data/data_services/cart_data_service.dart';
import 'package:nestafar_task/features/cart/data/repository_impl/cart_repository_impl.dart';
import 'package:nestafar_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:nestafar_task/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:nestafar_task/features/cart/domain/usecases/get_cart_iteams_usecase.dart';
import 'package:nestafar_task/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:nestafar_task/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:nestafar_task/features/food/data/data_services/food_data_service.dart';
import 'package:nestafar_task/features/food/data/repositories_impl/food_repository_impl.dart';
import 'package:nestafar_task/features/food/domain/repositories/food_repository.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_by_category_usecase.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_by_id_usecase.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_iteams_usecase.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_bloc.dart';
import 'package:nestafar_task/features/order/data/data_services/order_data_service.dart';
import 'package:nestafar_task/features/order/data/repositories_impl/order_repository_impl.dart';
import 'package:nestafar_task/features/order/domain/repositories/order_repository.dart';
import 'package:nestafar_task/features/order/domain/usecases/get_orders_usecase.dart';
import 'package:nestafar_task/features/order/domain/usecases/place_order_usecase.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_bloc.dart';

final locator = GetIt.instance;

void initLocator() {
  //========================================================  data services
  //cart data service
  locator.registerLazySingleton<CartDataService>(() => CartDataService());

  //order data service
  locator.registerLazySingleton<OrderDataService>(() => OrderDataService());

  //food data service
  locator.registerLazySingleton<FoodDataService>(() => FoodDataService());

  //=========================================================== repositories

  //cart repo
  locator.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(locator<CartDataService>()),
  );

  //food repo
  locator.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(locator<FoodDataService>()),
  );

  //order repo
  locator.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(locator<OrderDataService>()),
  );

  //============================================================ usecases

  //======================================cart usecaes
  //add to cart usecases
  locator.registerLazySingleton<AddToCartUsecase>(
    () => AddToCartUsecase(locator<CartRepository>()),
  );
  //get cart iteams usecases
  locator.registerLazySingleton<GetCartIteamsUsecase>(
    () => GetCartIteamsUsecase(locator<CartRepository>()),
  );
  //remove from cart usecases
  locator.registerLazySingleton<RemoveFromCartUsecase>(
    () => RemoveFromCartUsecase(locator<CartRepository>()),
  );
  //update cart usecases
  locator.registerLazySingleton<UpdateCartUsecase>(
    () => UpdateCartUsecase(locator<CartRepository>()),
  );

  //===================================== food usescases
  //get food by  usecases
  locator.registerLazySingleton<GetFoodItemsUsecase>(
    () => GetFoodItemsUsecase(locator<FoodRepository>()),
  );
  //get food by  id  usecases
  locator.registerLazySingleton<GetFoodByIdUsecase>(
    () => GetFoodByIdUsecase(locator<FoodRepository>()),
  );
  //get food by  category  usecases
  locator.registerLazySingleton<GetFoodByCategoryUsecase>(
    () => GetFoodByCategoryUsecase(locator<FoodRepository>()),
  );

  //===================================== order usecases
  //get order usecases
  locator.registerLazySingleton<GetOrdersUsecase>(
    () => GetOrdersUsecase(locator<OrderRepository>()),
  );
  //place order usecases
  locator.registerLazySingleton<PlaceOrderUsecase>(
    () => PlaceOrderUsecase(locator<OrderRepository>()),
  );

  //====================================================== blocs
  //order bloc
  locator.registerFactory<OrderBloc>(
    () => OrderBloc(
      locator<GetOrdersUsecase>(),
      locator<PlaceOrderUsecase>(),
      locator<RemoveFromCartUsecase>(),
    ),
  );
  //food bloc
  locator.registerFactory<FoodBloc>(
    () => FoodBloc(
      locator<GetFoodByCategoryUsecase>(),
      locator<GetFoodByIdUsecase>(),
      locator<GetFoodItemsUsecase>(),
    ),
  );
  //cart bloc
  locator.registerFactory<CartBloc>(
    () => CartBloc(
      locator<GetCartIteamsUsecase>(),
      locator<AddToCartUsecase>(),
      locator<RemoveFromCartUsecase>(),
      locator<UpdateCartUsecase>(),
    ),
  );
}
