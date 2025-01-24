import 'package:bloc/bloc.dart';
import 'package:business_tracker/features/categories/domain/repositories/CategoryRepository.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit({required this.categoryRepository}) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    try {
      emit(CategoryLoading());
      final categories = await categoryRepository.fetchCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (error) {
      emit(CategoryError(message: error.toString()));
    }
  }

  Future<void> addCategory(String name, String company) async {
    try {
      emit(CategoryAdding());
      await categoryRepository.addCategory(name, company);
      emit(CategoryAdded());
    } catch (error) {
      emit(CategoryError(message: error.toString()));
    }
  }
}
