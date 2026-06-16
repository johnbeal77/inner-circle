import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_state.dart';
import 'profile.dart';
import 'profile_repository.dart';

final currentProfileProvider = FutureProvider<Profile?>((ref) async {
  final user = await ref.watch(authUserProvider.future);

  if (user == null) {
    return null;
  }

  return ref.watch(profileRepositoryProvider).fetchProfile(user.id);
});

final profileControllerProvider =
    StateNotifierProvider<ProfileController, AsyncValue<void>>((ref) {
  return ProfileController(ref);
});

class ProfileController extends StateNotifier<AsyncValue<void>> {
  ProfileController(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  Future<void> saveDisplayName({
    required String userId,
    required String displayName,
  }) async {
    final normalizedName = displayName.trim();

    if (normalizedName.isEmpty) {
      state = AsyncError(
        ArgumentError('Display name is required.'),
        StackTrace.current,
      );
      return;
    }

    state = const AsyncLoading();

    try {
      await _ref.read(profileRepositoryProvider).upsertProfile(
            userId: userId,
            displayName: normalizedName,
          );
      _ref.invalidate(currentProfileProvider);
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
