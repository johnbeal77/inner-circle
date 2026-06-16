import 'package:flutter/material.dart';

import 'supabase_bootstrap.dart';

class StartupErrorScreen extends StatelessWidget {
  const StartupErrorScreen({
    required this.bootstrapResult,
    super.key,
  });

  final SupabaseBootstrapResult bootstrapResult;

  @override
  Widget build(BuildContext context) {
    final missingKeys = bootstrapResult.missingConfigKeys;
    final message = missingKeys.isNotEmpty
        ? 'Missing required Supabase configuration: ${missingKeys.join(', ')}.'
        : 'Supabase could not start. Check your local configuration and try again.';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inner Circle setup needed',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(message),
                  const SizedBox(height: 12),
                  const Text(
                    'Run the app with --dart-define=SUPABASE_URL=... and '
                    '--dart-define=SUPABASE_ANON_KEY=....',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
