import 'package:bite_finder_app/core/constants/hive_table_constant.dart';
import 'package:bite_finder_app/features/category/data/domain/entities/category_entity.dart';
import 'package:hive/hive.dart';


import 'package:uuid/uuid.dart';

part 'category_hive_model.g.dart'; // dart run build_runner build -d

@HiveType(typeId: HiveTableConstant.categoryTypeId)
class CategoryHiveModel extends HiveObject {
  @HiveField(0)
  final String? categoryId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? status;

  CategoryHiveModel({
    String? categoryId,
    required this.name,
    this.description,
    String? status,
  })  : categoryId = categoryId ?? const Uuid().v4(),
        status = status ?? 'active';

  /// Convert Hive Model to Entity
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      description: description,
      status: status,
    );
  }

  /// Convert Entity to Hive Model
  factory CategoryHiveModel.fromEntity(CategoryEntity entity) {
    return CategoryHiveModel(
      categoryId: entity.categoryId,
      name: entity.name,
      description: entity.description,
      status: entity.status,
    );
  }

  /// Convert List of Hive Models to List of Entities
  static List<CategoryEntity> toEntityList(List<CategoryHiveModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
