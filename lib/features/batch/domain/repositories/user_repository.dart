import 'package:bite_finder_app/core/error/failures.dart';
import 'package:bite_finder_app/features/batch/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';


abstract interface class IRestaurantRepository {
  Future<Either<Failure, List<RestaurantEntity>>> getAllRestaurants();
  Future<Either<Failure, RestaurantEntity>> getRestaurantById(String restaurantId);
  Future<Either<Failure, bool>> createRestaurant(RestaurantEntity restaurant);
  Future<Either<Failure, bool>> updateRestaurant(RestaurantEntity restaurant);
  Future<Either<Failure, bool>> deleteRestaurant(String restaurantId);
}
