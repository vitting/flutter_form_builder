import 'package:flutter_web_formbuilder/api/api_client.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';

abstract interface class SchemaService {
  Future<Iterable<ElementModel>> getSchemaFields();
}

class SchemaServiceImpl implements SchemaService {
  SchemaServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Iterable<ElementModel>> getSchemaFields() async {
    return _apiClient.getAsync('/schemaFields').then((response) {
      return (response.data as List<dynamic>)
          .map((e) => ElementModel.fromJson(e))
          .toList();
    });
  }
}
