import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:nestafar_task/dependecy_injection.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_by_category_usecase.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_by_id_usecase.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_iteams_usecase.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_bloc.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_event.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_state.dart';

void main() {
  group('FoodBloc', () {
    late FoodBloc foodBloc;
    // Add proper mock dependencies setup here
    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      GetIt.I.reset();
      initLocator();
      foodBloc = FoodBloc(
        locator<GetFoodByCategoryUsecase>(),
        locator<GetFoodByIdUsecase>(),
        locator<GetFoodItemsUsecase>(),
      );
    });

    test('initial state is FoodInitialState', () {
      expect(foodBloc.state, isA<FoodInitialState>());
    });

    blocTest<FoodBloc, FoodState>(
      'emits [FoodLoadingState, FoodSuccessState] when GetFoodsEvent is added',
      build: () => foodBloc,
      act: (bloc) => bloc.add(GetFoodsEvent()),
      expect: () => [isA<FoodLoadingState>(), isA<FoodSuccessState>()],
    );
  });
}
