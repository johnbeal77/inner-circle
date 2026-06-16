import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app/bootstrap/supabase_client_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(supabaseClientProvider));
});

class AuthRepository {
  const AuthRepository(this._client);

  final SupabaseClient _client;

  User? get currentUser => _client.auth.currentUser;

  Stream<User?> authStateChanges() async* {
    yield _client.auth.currentUser;

    await for (final state in _client.auth.onAuthStateChange) {
      yield state.session?.user;
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await _client.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _client.auth.signOut();
  }
}
