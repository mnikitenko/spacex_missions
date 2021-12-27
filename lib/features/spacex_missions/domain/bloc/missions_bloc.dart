import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spacex_missions/features/spacex_missions/domain/model/mission.dart';
import 'package:spacex_missions/features/spacex_missions/domain/repository/missions_repository.dart';

import '../../../../logger.dart';
import 'bloc.dart';

class MissionsBloc extends Bloc<MissionsEvent, MissionsState> {
  final MissionsRepository repository;

  MissionsBloc({
    required this.repository,
  }) : super(EmptyState()) {
    on<FindMissionsByNameEvent>(
        (event, emit) => _findMissionsByName(event.name, emit),
        transformer: (events, transitionFn) {
      return events
          .debounceTime(const Duration(seconds: 1))
          .switchMap((transitionFn));
    });
  }

  void _findMissionsByName(String name, Emitter<MissionsState> emit) async {
    Logger.d('find by name = $name');
    emit(LoadingState());
    final List<Mission>? missions = await repository.findMissionsByName(name);
    if (missions != null && missions.isNotEmpty) {
      emit(DisplayDataState(missions));
    } else {
      emit(EmptyState());
    }
  }
}
