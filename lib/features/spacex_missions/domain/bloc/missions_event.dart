abstract class MissionsEvent {
  const MissionsEvent();
}

class FindMissionsByNameEvent extends MissionsEvent {
  final String name;

  const FindMissionsByNameEvent(this.name);
}
