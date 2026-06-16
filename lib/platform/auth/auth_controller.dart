import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController(ref.watch(authRepositoryProvider));
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController(this._repository) : super(const AsyncData(null));

  final AuthRepository _repository;

  Future<void> signIn({
    required String email,
    required String password,
  }) {
    return _run(() {
      return _repository.signIn(email: email, password: password);
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) {
    return _run(() {
      return _repository.signUp(email: email, password: password);
    });
  }

  Future<void> signOut() {
    return _run(_repository.signOut);
  }

  Future<void> _run(Future<void> Function() action) async {
    state = const AsyncLoading();

    try {
      await action();
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
