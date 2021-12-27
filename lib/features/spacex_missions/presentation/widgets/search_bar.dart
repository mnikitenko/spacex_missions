import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_missions/features/spacex_missions/domain/bloc/missions_bloc.dart';
import 'package:spacex_missions/features/spacex_missions/domain/bloc/missions_event.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = TextEditingController();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          hintText: 'Type mission name',
          errorText: hasError ? 'Enter at least 3 characters' : null,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: const Icon(Icons.close_rounded),
          ),
        ),
        onChanged: (String input) {
          if (_isValidInput(input)) {
            if (hasError) {
              setState(() => hasError = false);
            }
            _search(context, input);
          }
          if (!_isValidInput(input) && !hasError) {
            setState(() => hasError = true);
          }
        },
      ),
    );
  }

  void _search(BuildContext context, String input) {
    BlocProvider.of<MissionsBloc>(context).add(FindMissionsByNameEvent(input));
  }

  bool _isValidInput(String? input) {
    bool isValid = false;
    if (input != null && input.isNotEmpty && input.length > 2) {
      isValid = true;
    }
    return isValid;
  }
}
