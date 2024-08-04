import 'package:flutter_web_formbuilder/models/definition_model.dart';
import 'package:flutter_web_formbuilder/services/tool_field_service.dart';

abstract interface class ToolFieldRepository {
  Future<Iterable<DefinitionModel>> getToolInputFields();
  Future<Iterable<DefinitionModel>> getToolLayoutFields();
}

class ToolFieldRepositoryImpl implements ToolFieldRepository {
  ToolFieldRepositoryImpl(this._service);

  final ToolFieldService _service;

  @override
  Future<Iterable<DefinitionModel>> getToolInputFields() async {
    return _service.getToolInputFields();
  }

  @override
  Future<Iterable<DefinitionModel>> getToolLayoutFields() async {
    return _service.getToolLayoutFields();
  }
}
