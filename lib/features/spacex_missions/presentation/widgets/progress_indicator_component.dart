import 'package:flutter/material.dart';

class ProgressIndicatorComponent extends StatelessWidget {
  const ProgressIndicatorComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
