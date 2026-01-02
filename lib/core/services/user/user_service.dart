// import 'package:bite_finder_app/core/constants/hive_table_constant.dart';
// import 'package:bite_finder_app/features/batch/data/models/user_hive_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';

// import 'package:path_provider/path_provider.dart';

// final hiveServiceProvider = Provider<HiveService>((ref) {
//   return HiveService();
// });

// class HiveService {
//   Future<void> init() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final path = '${directory.path}/${HiveTableConstant.dbName}';
//     Hive.init(path);

//     _registerAdapters();
//     await _openBoxes();

//     await insertRestaurantDummyData();
//     await insertCategoryDummyData();
//   }

//   // ==================== Dummy Data ======================

//   Future<void> insertRestaurantDummyData() async {
//     final restaurantBox =
//         Hive.box<RestaurantHiveModel>(HiveTableConstant.restaurantTable);

//     if (restaurantBox.isNotEmpty) {
//       return;
//     }

//     final dummyRestaurants = [
//       RestaurantHiveModel(
//         restaurantName: 'The Himalayan Grill',
//         description: 'Authentic Nepali cuisine',
//         rating: 4.5,
//         category: 'Nepali',
//       ),
//       RestaurantHiveModel(
//         restaurantName: 'Pizza Hub',
//         description: 'Italian pizzas & pasta',
//         rating: 4.2,
//         category: 'Italian',
//       ),
//       RestaurantHiveModel(
//         restaurantName: 'Burger Point',
//         description: 'Juicy burgers & fries',
//         rating: 4.0,
//         category: 'Fast Food',
//       ),
//     ];

//     for (var restaurant in dummyRestaurants) {
//       await restaurantBox.put(restaurant.restaurantId, restaurant);
//     }
//   }

//   Future<void> insertCategoryDummyData() async {
//     final categoryBox =
//         Hive.box<CategoryHiveModel>(HiveTableConstant.categoryTable);

//     if (categoryBox.isNotEmpty) {
//       return;
//     }

//     final dummyCategories = [
//       CategoryHiveModel(name: 'Nepali', description: 'Traditional Nepali food'),
//       CategoryHiveModel(name: 'Italian', description: 'Pizza & pasta'),
//       CategoryHiveModel(name: 'Fast Food', description: 'Burgers & snacks'),
//       CategoryHiveModel(name: 'Chinese', description: 'Asian cuisine'),
//       CategoryHiveModel(name: 'Desserts', description: 'Sweet dishes'),
//     ];

//     for (var category in dummyCategories) {
//       await categoryBox.put(category.categoryId, category);
//     }
//   }

//   // ==================== Adapter Registration ======================

//   void _registerAdapters() {
//     if (!Hive.isAdapterRegistered(HiveTableConstant.restaurantTypeId)) {
//       Hive.registerAdapter(RestaurantHiveModelAdapter());
//     }
//     if (!Hive.isAdapterRegistered(HiveTableConstant.categoryTypeId)) {
//       Hive.registerAdapter(CategoryHiveModelAdapter());
//     }
//     if (!Hive.isAdapterRegistered(HiveTableConstant.userTypeId)) {
//       Hive.registerAdapter(AuthHiveModelAdapter());
//     }
//   }

//   // ==================== Open Boxes ======================

//   Future<void> _openBoxes() async {
//     await Hive.openBox<RestaurantHiveModel>(
//       HiveTableConstant.restaurantTable,
//     );
//     await Hive.openBox<AuthHiveModel>(HiveTableConstant.userTable);
//     await Hive.openBox<CategoryHiveModel>(
//       HiveTableConstant.categoryTable,
//     );
//   }

//   // Close Hive
//   Future<void> close() async {
//     await Hive.close();
//   }

//   // ==================== Restaurant CRUD ======================

//   Box<RestaurantHiveModel> get _restaurantBox =>
//       Hive.box<RestaurantHiveModel>(HiveTableConstant.restaurantTable);

//   Future<RestaurantHiveModel> createRestaurant(
//     RestaurantHiveModel restaurant,
//   ) async {
//     await _restaurantBox.put(restaurant.restaurantId, restaurant);
//     return restaurant;
//   }

//   List<RestaurantHiveModel> getAllRestaurants() {
//     return _restaurantBox.values.toList();
//   }

//   RestaurantHiveModel? getRestaurantById(String restaurantId) {
//     return _restaurantBox.get(restaurantId);
//   }

//   Future<void> updateRestaurant(RestaurantHiveModel restaurant) async {
//     await _restaurantBox.put(restaurant.restaurantId, restaurant);
//   }

//   Future<void> deleteRestaurant(String restaurantId) async {
//     await _restaurantBox.delete(restaurantId);
//   }

//   // ==================== Category CRUD ======================

//   Box<CategoryHiveModel> get _categoryBox =>
//       Hive.box<CategoryHiveModel>(HiveTableConstant.categoryTable);

//   Future<CategoryHiveModel> createCategory(CategoryHiveModel category) async {
//     await _categoryBox.put(category.categoryId, category);
//     return category;
//   }

//   List<CategoryHiveModel> getAllCategories() {
//     return _categoryBox.values.toList();
//   }

//   CategoryHiveModel? getCategoryById(String categoryId) {
//     return _categoryBox.get(categoryId);
//   }

//   Future<bool> updateCategory(CategoryHiveModel category) async {
//     if (_categoryBox.containsKey(category.categoryId)) {
//       await _categoryBox.put(category.categoryId, category);
//       return true;
//     }
//     return false;
//   }

//   Future<void> deleteCategory(String categoryId) async {
//     await _categoryBox.delete(categoryId);
//   }

//   // ==================== Auth CRUD ======================

//   Box<AuthHiveModel> get _authBox =>
//       Hive.box<AuthHiveModel>(HiveTableConstant.userTable);

//   Future<AuthHiveModel> register(AuthHiveModel user) async {
//     await _authBox.put(user.authId, user);
//     return user;
//   }

//   AuthHiveModel? login(String email, String password) {
//     try {
//       return _authBox.values.firstWhere(
//         (user) => user.email == email && user.password == password,
//       );
//     } catch (e) {
//       return null;
//     }
//   }

//   AuthHiveModel? getUserById(String authId) {
//     return _authBox.get(authId);
//   }

//   AuthHiveModel? getUserByEmail(String email) {
//     try {
//       return _authBox.values.firstWhere((user) => user.email == email);
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<bool> updateUser(AuthHiveModel user) async {
//     if (_authBox.containsKey(user.authId)) {
//       await _authBox.put(user.authId, user);
//       return true;
//     }
//     return false;
//   }

//   Future<void> deleteUser(String authId) async {
//     await _authBox.delete(authId);
//   }

//   bool doesEmailExist(String email) {
//     return _authBox.values.any((user) => user.email == email);
//   }
// }
