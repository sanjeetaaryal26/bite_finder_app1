import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
  final String? restaurantId;
  final String restaurantName;
  final String? description;
  final double? rating;
  final String? imageUrl;
  final String? category;

  const RestaurantEntity({
    this.restaurantId,
    required this.restaurantName,
    this.description,
    this.rating,
    this.imageUrl,
    this.category,
  });

  @override
  List<Object?> get props => [
        restaurantId,
        restaurantName,
        description,
        rating,
        imageUrl,
        category,
      ];
}
