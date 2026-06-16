import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_shell.dart';
import '../../platform/circles/circle_home_screen.dart';
import '../../shared/errors/error_message.dart';
import '../profiles/profile_completion_screen.dart';
import '../profiles/profile_controller.dart';
import 'auth_state.dart';
import 'login_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authUserProvider);

    return authUser.when(
      loading: () => const _LoadingScreen(),
      error: (error, stackTrace) => _CenteredError(
        message: 'Unable to check your sign-in state. Please try again.',
        onRetry: () => ref.invalidate(authUserProvider),
      ),
      data: (user) {
        if (user == null) {
          return const LoginScreen();
        }

        final profile = ref.watch(currentProfileProvider);

        return profile.when(
          loading: () => const _LoadingScreen(),
          error: (error, stackTrace) => _CenteredError(
            message: 'Unable to load your profile. Please try again.',
            onRetry: () => ref.invalidate(currentProfileProvider),
          ),
          data: (profile) {
            if (profile == null) {
              return ProfileCompletionScreen(userId: user.id);
            }

            return const AppShell(child: CircleHomeScreen());
          },
        );
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class _CenteredError extends StatelessWidget {
  const _CenteredError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ErrorMessage(
              message: message,
              onRetry: onRetry,
            ),
          ),
        ),
      ),
    );
  }
}
