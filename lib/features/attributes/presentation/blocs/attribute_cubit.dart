import 'package:business_tracker/features/attributes/data/repository/attribute_repository.dart';
import 'package:business_tracker/features/attributes/domain/entities/attribute_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttributeCubit extends Cubit<List<Attribute>> {
  final AttributeRepository repository;
  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;

  AttributeCubit(this.repository) : super([]);

  Future<void> loadAttributes() async {
    if (isLastPage || isLoading) return;

    isLoading = true;
    try {
      final response = await repository.getAttributes(currentPage);
      if (response.results != null && response.results!.isNotEmpty) {
        emit([...response.results!]); // Emit only the fresh data
        currentPage++;
      } else {
        isLastPage = true;
      }
    } catch (e) {
      print('Error loading attribute types: $e');
    } finally {
      isLoading = false;
    }
  }

  Future<void> addAttribute(String name, String attribute_type) async {
    try {
      // Save the new attribute to the repository
      final savedAttribute =
          await repository.addAttribute(name, attribute_type);

      // Update the state with the new attribute
      emit([savedAttribute, ...state]);
    } catch (e) {
      // Handle errors
      print('Error adding attribute type: $e');
    }
  }
}
