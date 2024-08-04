import 'package:flutter_web_formbuilder/api/api_client.dart';
import 'package:flutter_web_formbuilder/models/definition_model.dart';

abstract interface class ToolFieldService {
  Future<Iterable<DefinitionModel>> getToolInputFields();
  Future<Iterable<DefinitionModel>> getToolLayoutFields();
}

class ToolFieldServiceImpl extends ToolFieldService {
  ToolFieldServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Iterable<DefinitionModel>> getToolInputFields() async {
    return _apiClient.getAsync('/inputFields').then((response) {
      return (response.data as List<dynamic>)
          .map((e) => DefinitionModel.fromJson(e))
          .toList();
    });
  }

  @override
  Future<Iterable<DefinitionModel>> getToolLayoutFields() async {
    return _apiClient.getAsync('/layoutFields').then((response) {
      return (response.data as List<dynamic>)
          .map((e) => DefinitionModel.fromJson(e))
          .toList();
    });
  }
}
