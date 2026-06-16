import 'package:flutter_test/flutter_test.dart';
import 'package:inner_circle/platform/profiles/profile.dart';

void main() {
  test('creates a profile from Supabase row data', () {
    final profile = Profile.fromJson({
      'id': 'user-id',
      'display_name': 'Kelly',
      'avatar_url': null,
    });

    expect(profile.id, 'user-id');
    expect(profile.displayName, 'Kelly');
    expect(profile.avatarUrl, isNull);
  });

  test('serializes a profile to Supabase column names', () {
    const profile = Profile(
      id: 'user-id',
      displayName: 'Kelly',
      avatarUrl: 'https://example.com/avatar.png',
    );

    expect(profile.toJson(), {
      'id': 'user-id',
      'display_name': 'Kelly',
      'avatar_url': 'https://example.com/avatar.png',
    });
  });
}
