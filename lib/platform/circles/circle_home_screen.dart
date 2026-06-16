import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../shared/widgets/section_header.dart';

class CircleHomeScreen extends StatelessWidget {
  const CircleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeader(
          title: 'Circle Home',
          subtitle: 'A private space for shared tools and social play.',
        ),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            title: const Text('Game Night'),
            subtitle: const Text('Open the Game Night placeholder.'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.gameNight),
          ),
        ),
      ],
    );
  }
}
