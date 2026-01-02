import 'package:bite_finder_app/core/constants/hive_table_constant.dart';
import 'package:bite_finder_app/features/batch/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';

import 'package:uuid/uuid.dart';

part 'user_hive_model.g.dart'; 


@HiveType(typeId: HiveTableConstant.restaurantTypeId)
class RestaurantHiveModel extends HiveObject {
  @HiveField(0)
  final String? restaurantId;

  @HiveField(1)
  final String restaurantName;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final double? rating;

  @HiveField(4)
  final String? imageUrl;

  @HiveField(5)
  final String? category;

  RestaurantHiveModel({
    String? restaurantId,
    required this.restaurantName,
    this.description,
    this.rating,
    this.imageUrl,
    this.category,
  }) : restaurantId = restaurantId ?? const Uuid().v4();

  /// Convert Hive Model to Entity
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      description: description,
      rating: rating,
      imageUrl: imageUrl,
      category: category,
    );
  }

  /// Convert Entity to Hive Model
  factory RestaurantHiveModel.fromEntity(RestaurantEntity entity) {
    return RestaurantHiveModel(
      restaurantId: entity.restaurantId,
      restaurantName: entity.restaurantName,
      description: entity.description,
      rating: entity.rating,
      imageUrl: entity.imageUrl,
      category: entity.category,
    );
  }

  /// Convert List of Models to List of Entities
  static List<RestaurantEntity> toEntityList(
    List<RestaurantHiveModel> models,
  ) {
    return models.map((model) => model.toEntity()).toList();
  }
}
