import 'package:business_tracker/features/attributes/data/datasources/attribute_remote_data_source.dart';
import 'package:business_tracker/features/attributes/data/repository/attribute_repository.dart';
import 'package:business_tracker/features/attributes/domain/entities/attribute_response.dart';

class AttributeRepositoryImpl implements AttributeRepository {
  final AttributeRemoteDataSource remoteDataSource;

  AttributeRepositoryImpl(this.remoteDataSource);

  @override
  Future<AttributeResponse> getAttributes(int page) async {
    final response = await remoteDataSource.getAttributes(page);
    return AttributeResponse.fromJson(response);
  }

  @override
  Future<Attribute> addAttribute(String name, String attributeType) async {
    final response = await remoteDataSource.addAttribute(name, attributeType);
    return Attribute.fromJson(response);
  }
}
