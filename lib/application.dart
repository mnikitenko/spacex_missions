import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_missions/features/spacex_missions/presentation/missions_page.dart';
import 'package:spacex_missions/locator.dart';

import 'features/spacex_missions/domain/bloc/missions_bloc.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX missions',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (_) => locator<MissionsBloc>(),
        child: const MissionsPage(),
      ),
    );
  }
}
