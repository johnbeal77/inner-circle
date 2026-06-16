import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../shared/widgets/section_header.dart';

class GameNightScreen extends StatelessWidget {
  const GameNightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeader(
          title: 'Game Night',
          subtitle: 'Placeholder module shell for shared play sessions.',
        ),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            title: const Text('Game Hat'),
            subtitle: const Text('Prompt-based play for Act It Out and Draw It.'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.gameHat),
          ),
        ),
      ],
    );
  }
}
