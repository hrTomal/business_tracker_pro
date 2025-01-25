import 'package:business_tracker/features/attribute-types/domain/entities/AttributeTypeResponse.dart';

abstract class AttributeTypeRepository {
  Future<AttributeTypeResponse> getAttributeTypes(int page);

  Future<AttributeType> addAttributeType(String typeName);
}
