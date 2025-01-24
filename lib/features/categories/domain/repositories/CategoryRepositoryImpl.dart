import 'package:business_tracker/features/categories/data/datasources/CategoryRemoteSource.dart';
import 'package:business_tracker/features/categories/domain/entities/CategoryResponse.dart';
import 'package:business_tracker/features/categories/domain/repositories/CategoryRepository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryInformation>> fetchCategories() async {
    try {
      final res = await remoteDataSource.fetchCategories();
      return res.results ?? [];
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  @override
  Future<void> addCategory(String name, String company) async {
    await remoteDataSource.addCategory({
      'name': name,
      'company': company,
    });
  }
}
