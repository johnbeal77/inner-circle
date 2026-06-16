import 'package:flutter/material.dart';

import '../../../shared/widgets/section_header.dart';

class GameHatScreen extends StatelessWidget {
  const GameHatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        SectionHeader(
          title: 'Game Hat',
          subtitle: 'Placeholder tool shell. Gameplay logic is not implemented yet.',
        ),
        SizedBox(height: 16),
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Next later: session setup, prompt submission, timers, and scoring.',
            ),
          ),
        ),
      ],
    );
  }
}
