import 'package:spacex_missions/features/spacex_missions/data/services/missions_service.dart';
import 'package:spacex_missions/features/spacex_missions/domain/model/mission.dart';

abstract class MissionsRepository {
  Future<List<Mission>> findMissionsByName(String name);
}

class MissionsRepositoryImpl implements MissionsRepository {
  final MissionsService _missionsService;

  MissionsRepositoryImpl(this._missionsService);

  @override
  Future<List<Mission>> findMissionsByName(String name) async {
    return _missionsService.findMissionsByName(name);
  }
}
