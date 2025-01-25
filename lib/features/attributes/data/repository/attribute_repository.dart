import 'package:business_tracker/features/attributes/domain/entities/attribute_response.dart';

abstract class AttributeRepository {
  Future<AttributeResponse> getAttributes(int page);

  Future<Attribute> addAttribute(String name, String attributeType);
}
