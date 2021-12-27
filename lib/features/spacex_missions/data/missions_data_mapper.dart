import 'package:graphql_flutter/graphql_flutter.dart';

import '../domain/model/mission.dart';

class MissionsDataMapper {
  static List<Mission> map(QueryResult result) {
    final List? dataMissions = result.data!['launches'];
    final List<Mission> missions = [];
    if (dataMissions != null) {
      for (var item in dataMissions) {
        final String name = item["mission_name"] ?? '';
        String details = '';
        if (item["details"] != null && item["details"] != 'null') {
          var data = item["details"];
          details = data is String ? data : data.toString();
        }
        missions.add(Mission(
          name: name,
          details: details,
        ));
      }
    }
    return missions;
  }
}
