import 'package:business_tracker/features/attribute-types/data/datasources/AttributeTypeDataSource.dart';
import 'package:business_tracker/features/attribute-types/data/repository/AttributeTypeRepository.dart';
import 'package:business_tracker/features/attribute-types/domain/entities/AttributeTypeResponse.dart';

class AttributeTypeRepositoryImpl implements AttributeTypeRepository {
  final Attributetypedatasource remoteDataSource;

  AttributeTypeRepositoryImpl(this.remoteDataSource);

  @override
  Future<AttributeTypeResponse> getAttributeTypes(int page) async {
    final response = await remoteDataSource.getAttributeTypes(page);
    return AttributeTypeResponse.fromJson(response);
  }

  @override
  Future<AttributeType> addAttributeType(String typeName) async {
    final response = await remoteDataSource.addAttributeType(typeName);
    return AttributeType.fromJson(response);
  }
}
