import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:howmuch/constant/const.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri: 'https://parseapi.back4app.com/graphql',
    headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-Client-Key': kParseClientKey,
      'X-Parse-Master-Key': kParseMasterKey,
      //'X-Parse-REST-API-Key' : kParseRestApiKey,
    }, //getheaders()
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}
