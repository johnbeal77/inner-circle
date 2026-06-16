import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app/bootstrap/supabase_client_provider.dart';
import 'profile.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(supabaseClientProvider));
});

class ProfileRepository {
  const ProfileRepository(this._client);

  final SupabaseClient _client;

  Future<Profile?> fetchProfile(String userId) async {
    final row = await _client
        .from('profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();

    if (row == null) {
      return null;
    }

    return Profile.fromJson(row);
  }

  Future<Profile> upsertProfile({
    required String userId,
    required String displayName,
  }) async {
    final normalizedName = displayName.trim();
    final row = await _client
        .from('profiles')
        .upsert({
          'id': userId,
          'display_name': normalizedName,
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        })
        .select()
        .single();

    return Profile.fromJson(row);
  }
}
