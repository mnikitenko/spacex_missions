import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_missions/core/qraphql/graphql_client.dart';
import 'package:spacex_missions/features/spacex_missions/data/api/query/find_mission_by_name.dart';
import 'package:spacex_missions/features/spacex_missions/domain/model/mission.dart';

import '../missions_data_mapper.dart';

class MissionsService{
  final GraphqlClient _client;

  MissionsService(this._client);

  Future<List<Mission>> findMissionsByName(String name) async {
    final QueryResult result = await _client.query(findMissionByName(name));
    List<Mission> missions = [];
    if (!result.hasException) {
      missions = MissionsDataMapper.map(result);
    }
    return missions;
  }
}