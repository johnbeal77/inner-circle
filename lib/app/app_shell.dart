import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../platform/auth/auth_controller.dart';

final activeCircleNameProvider = Provider<String>((ref) => 'Demo Circle');

class AppShell extends ConsumerWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final circleName = ref.watch(activeCircleNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(circleName),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            child: const Text('Log out'),
          ),
        ],
      ),
      body: SafeArea(child: child),
    );
  }
}
