import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/services/schema_service.dart';

abstract interface class SchemaRepository {}

class SchemaRepositoryImpl implements SchemaRepository {
  SchemaRepositoryImpl(this._service);

  final SchemaService _service;

  Future<Iterable<ElementModel>> getSchemaFields() async {
    return _service.getSchemaFields();
  }
}
