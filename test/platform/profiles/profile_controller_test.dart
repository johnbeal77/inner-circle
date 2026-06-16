import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inner_circle/platform/profiles/profile_controller.dart';

void main() {
  test('rejects an empty display name before touching the repository', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await container
        .read(profileControllerProvider.notifier)
        .saveDisplayName(userId: 'user-id', displayName: '   ');

    expect(container.read(profileControllerProvider).hasError, isTrue);
  });
}
