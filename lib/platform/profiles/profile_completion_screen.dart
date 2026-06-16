import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/errors/error_message.dart';
import '../auth/auth_controller.dart';
import 'profile_controller.dart';

class ProfileCompletionScreen extends ConsumerStatefulWidget {
  const ProfileCompletionScreen({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  ConsumerState<ProfileCompletionScreen> createState() =>
      _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState
    extends ConsumerState<ProfileCompletionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();

  @override
  void dispose() {
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileControllerProvider);
    final isLoading = profileState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finish profile'),
        actions: [
          TextButton(
            onPressed: isLoading
                ? null
                : () => ref.read(authControllerProvider.notifier).signOut(),
            child: const Text('Log out'),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'What should your Circle call you?',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text('Add a display name to finish your profile.'),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _displayNameController,
                      decoration:
                          const InputDecoration(labelText: 'Display name'),
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Display name is required';
                        }

                        return null;
                      },
                      onFieldSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: 16),
                    if (profileState.hasError) ...[
                      const ErrorMessage(
                        message: 'Profile could not be saved. Please try again.',
                      ),
                      const SizedBox(height: 16),
                    ],
                    FilledButton(
                      onPressed: isLoading ? null : _submit,
                      child: isLoading
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Continue'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await ref.read(profileControllerProvider.notifier).saveDisplayName(
          userId: widget.userId,
          displayName: _displayNameController.text,
        );
  }
}
