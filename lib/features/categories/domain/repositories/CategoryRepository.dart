import 'package:business_tracker/features/categories/domain/entities/CategoryResponse.dart';

abstract class CategoryRepository {
  Future<List<CategoryInformation>> fetchCategories();
  Future<void> addCategory(String name, String company);
}
