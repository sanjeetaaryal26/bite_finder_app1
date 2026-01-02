import 'package:bite_finder_app/core/constants/hive_table_constant.dart';
import 'package:bite_finder_app/features/category/data/models/category_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});

class HiveService {
  Future<void> init() async {
    // final directory = await getApplicationDocumentsDirectory();
    // final path = '${directory.path}/${HiveTableConstant.dbName}';
    // Hive.init(path);

    // _registerAdapters();
    // await _openBoxes();

    // await insertRestaurantDummyData();
    // await insertCategoryDummyData();
  }

  Future<void> createCategory(CategoryHiveModel category) async {
    final categoryBox = Hive.box<CategoryHiveModel>(
      HiveTableConstant.categoryTable,
    );
    await categoryBox.put(category.categoryId, category);
  }

  Future<void> deleteCategory(String categoryId) async {
    final categoryBox = Hive.box<CategoryHiveModel>(
      HiveTableConstant.categoryTable,
    );
    await categoryBox.delete(categoryId);
  }

  Future<List<CategoryHiveModel>> getAllCategories() async {
    final categoryBox = Hive.box<CategoryHiveModel>(
      HiveTableConstant.categoryTable,
    );
    return categoryBox.values.toList();
  }

  Future<CategoryHiveModel?> getCategoryById(String categoryId) async {
    final categoryBox = Hive.box<CategoryHiveModel>(
      HiveTableConstant.categoryTable,
    );
    return categoryBox.get(categoryId);
  }

  Future<void> updateCategory(CategoryHiveModel category) async {
    final categoryBox = Hive.box<CategoryHiveModel>(
      HiveTableConstant.categoryTable,
    );
    await categoryBox.put(category.categoryId, category);
  }
}
