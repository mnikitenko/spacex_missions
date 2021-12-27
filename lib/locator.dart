import 'package:get_it/get_it.dart';
import 'package:spacex_missions/features/spacex_missions/data/services/missions_service.dart';

import 'core/qraphql/graphql_client.dart';
import 'features/spacex_missions/domain/bloc/missions_bloc.dart';
import 'features/spacex_missions/domain/repository/missions_repository.dart';

final GetIt locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(
    () => MissionsBloc(repository: locator()),
  );

  locator.registerLazySingleton<MissionsRepository>(
    () => MissionsRepositoryImpl(locator()),
  );

  locator.registerLazySingleton<GraphqlClient>(
    () => GraphqlClient(),
  );

  locator.registerLazySingleton<MissionsService>(
    () => MissionsService(locator()),
  );
}
