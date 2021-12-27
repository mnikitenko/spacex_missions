import 'package:equatable/equatable.dart';
import 'package:spacex_missions/features/spacex_missions/domain/model/mission.dart';

abstract class MissionsState extends Equatable {
  const MissionsState();

  @override
  List<Object?> get props => [];
}

class EmptyState extends MissionsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MissionsState {
  @override
  List<Object> get props => [];
}

class DisplayDataState extends MissionsState {
  final List<Mission> missions;

  const DisplayDataState(this.missions);

  @override
  List<Object> get props => [missions];
}
