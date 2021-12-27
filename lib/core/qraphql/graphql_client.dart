import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlClient {
  late final GraphQLClient _client;
  final HttpLink _httpLink = HttpLink('https://api.spacex.land/graphql/');

  GraphqlClient() {
    _client = GraphQLClient(cache: GraphQLCache(), link: _httpLink);
  }

  Future<QueryResult> query(String query) async {
    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await _client.query(options);
    return result;
  }
}
