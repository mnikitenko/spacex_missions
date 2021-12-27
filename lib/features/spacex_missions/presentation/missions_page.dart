import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_missions/features/spacex_missions/domain/bloc/bloc.dart';
import 'package:spacex_missions/features/spacex_missions/presentation/widgets/missions_list_view.dart';
import 'package:spacex_missions/features/spacex_missions/presentation/widgets/progress_indicator_component.dart';
import 'package:spacex_missions/features/spacex_missions/presentation/widgets/search_bar.dart';

class MissionsPage extends StatelessWidget {
  const MissionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX missions'),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SearchBar(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<MissionsBloc, MissionsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const ProgressIndicatorComponent();
        }
        if (state is DisplayDataState) {
          return state.missions.isNotEmpty
              ? MissionsListView(missions: state.missions)
              : const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
