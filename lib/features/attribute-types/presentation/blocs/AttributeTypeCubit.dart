import 'package:business_tracker/features/attribute-types/data/repository/AttributeTypeRepository.dart';
import 'package:business_tracker/features/attribute-types/domain/entities/AttributeTypeResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Attributetypecubit extends Cubit<List<AttributeType>> {
  final AttributeTypeRepository repository;
  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;

  Attributetypecubit(this.repository) : super([]);

  Future<void> loadAttributeTypes() async {
    if (isLastPage || isLoading) return;

    isLoading = true;
    try {
      final response = await repository.getAttributeTypes(currentPage);
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

  Future<void> addAttributeType(String typeName) async {
    try {
      // Save the new attribute to the repository
      final savedAttribute = await repository.addAttributeType(typeName);

      // Update the state with the new attribute
      emit([savedAttribute, ...state]);
    } catch (e) {
      // Handle errors
      print('Error adding attribute type: $e');
    }
  }
}
