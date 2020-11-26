import 'package:graphql_flutter/graphql_flutter.dart';

import '../api/category_api.dart';
import '../graphql/graphql_conf.dart';

class CategoryUtilsGraphQL {
  final String id, objectId, name, iconfamily, iconpackage;
  final int color, icon, performance, counter;

  CategoryUtilsGraphQL(
      {this.id = "",
      this.objectId = "",
      this.name = "",
      this.color = 0,
      this.icon = 0,
      this.iconfamily = "",
      this.iconpackage = "",
      this.performance = 0,
      this.counter = 0});

  Future<QueryResult> deleteData() async {
    final variable = {
      "id": id,
    };

    GraphQLConfiguration configuration = GraphQLConfiguration();
    GraphQLClient client = configuration.clientToQuery();

    QueryResult queryResult = await client.query(
      QueryOptions(
          documentNode: gql(deleteCategoryMutation), variables: variable),
    );

    return queryResult;
  }

  Future<QueryResult> sendData() async {
    final variable = {
      "name": name,
    };

    GraphQLConfiguration configuration = GraphQLConfiguration();
    GraphQLClient client = configuration.clientToQuery();

    QueryResult queryResult = await client.query(
      QueryOptions(
          documentNode: gql(createCategoryMutation), variables: variable),
    );

    return queryResult;
  }

  Future<QueryResult> updateData() async {
    final variable = {
      "id": id,
      "input": {
        "name": name,
        "color": color,
        "icon": icon,
        "iconfamily": iconfamily,
        "iconpackage": iconpackage,
        "performance": performance,
        "counter": counter
      }
    };

    GraphQLConfiguration configuration = GraphQLConfiguration();
    GraphQLClient client = configuration.clientToQuery();

    QueryResult queryResult = await client.query(
      QueryOptions(
          documentNode: gql(updateCategoryMutation), variables: variable),
    );

    return queryResult;
  }
}