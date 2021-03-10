import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/parse_erros.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

class CategoryRepository {

  Future<List<Category>> getList() async {
    final queryBuild = QueryBuilder(ParseObject(KeyCategoryTabel))
        ..orderByAscending(KeyCategoryDescription);

    final response = await  queryBuild.query();
    if(response.success){
      return response.results.map((p) => Category.fromParse(p)).toList();
    }else{
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}