import 'package:flutter/material.dart';
import 'package:spacex_missions/features/spacex_missions/domain/model/mission.dart';

class MissionsListView extends StatelessWidget {
  final List<Mission> missions;

  const MissionsListView({
    required this.missions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: missions.length,
      itemBuilder: (BuildContext context, int index) {
        final Mission mission = missions[index];
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            child: ListTile(
              title: Text(mission.name),
              subtitle: Text(mission.details),
            ),
          ),
        );
      },
    );
  }
}
