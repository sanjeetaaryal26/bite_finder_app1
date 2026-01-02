import 'package:equatable/equatable.dart';

/// Base Failure class
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Local database (Hive) related failures
class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure({
    String message = 'Local database operation failed',
  }) : super(message);
}

/// API / Network related failures
class ApiFailure extends Failure {
  final int? statusCode;

  const ApiFailure({
    required String message,
    this.statusCode,
  }) : super(message);

  @override
  List<Object?> get props => [message, statusCode];
}

/// Authentication failures (Login / Register)
class AuthFailure extends Failure {
  const AuthFailure({
    String message = 'Authentication failed',
  }) : super(message);
}

/// Restaurant related failures
class RestaurantFailure extends Failure {
  const RestaurantFailure({
    String message = 'Failed to load restaurant data',
  }) : super(message);
}

/// Review & Rating related failures
class ReviewFailure extends Failure {
  const ReviewFailure({
    String message = 'Failed to process review or rating',
  }) : super(message);
}

/// Favorite restaurants related failures
class FavoriteFailure extends Failure {
  const FavoriteFailure({
    String message = 'Failed to update favorite restaurants',
  }) : super(message);
}

/// Search & Filter related failures
class SearchFailure extends Failure {
  const SearchFailure({
    String message = 'Search operation failed',
  }) : super(message);
}
