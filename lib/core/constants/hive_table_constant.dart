class HiveTableConstant {
  HiveTableConstant._();

  // Database name
  static const String dbName = 'bite_finder_db';

  // User
  static const int userTypeId = 0;
  static const String userTable = 'user_table';

  // Restaurant
  static const int restaurantTypeId = 1;
  static const String restaurantTable = 'restaurant_table';

  // Review & Rating
  static const int reviewTypeId = 2;
  static const String reviewTable = 'review_table';

  // Favorite Restaurants
  static const int favoriteTypeId = 3;
  static const String favoriteTable = 'favorite_table';

  // Restaurant Category / Cuisine
  static const int categoryTypeId = 4;
  static const String categoryTable = 'category_table';
}
