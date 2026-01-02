import 'package:equatable/equatable.dart';

/// Base failure class for Bite Finder
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Local storage (Hive) failures
class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure({
    String message = 'Bite Finder local database operation failed',
  }) : super(message);
}

/// API / Network failures
class ApiFailure extends Failure {
  final int? statusCode;

  const ApiFailure({
    String message = 'Bite Finder API request failed',
    this.statusCode,
  }) : super(message);

  @override
  List<Object?> get props => [message, statusCode];
}
