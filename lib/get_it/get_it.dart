import 'package:flutter_web_formbuilder/api/api_client.dart';
import 'package:flutter_web_formbuilder/repositories/schema_repository.dart';
import 'package:flutter_web_formbuilder/repositories/tool_field_repository.dart';
import 'package:flutter_web_formbuilder/services/schema_service.dart';
import 'package:flutter_web_formbuilder/services/tool_field_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiClient>(ApiClientImpl());
  getIt.registerSingleton<ToolFieldService>(ToolFieldServiceImpl(getIt()));
  getIt
      .registerSingleton<ToolFieldRepository>(ToolFieldRepositoryImpl(getIt()));
  getIt.registerSingleton<SchemaService>(SchemaServiceImpl(getIt()));
  getIt.registerSingleton<SchemaRepository>(SchemaRepositoryImpl(getIt()));
}
