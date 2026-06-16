import 'package:flutter_test/flutter_test.dart';
import 'package:inner_circle/app/config/app_config.dart';

void main() {
  test('reports missing Supabase configuration keys', () {
    const config = AppConfig(
      supabaseUrl: '',
      supabaseAnonKey: '',
    );

    expect(config.isSupabaseConfigured, isFalse);
    expect(
      config.missingSupabaseKeys,
      ['SUPABASE_URL', 'SUPABASE_ANON_KEY'],
    );
  });

  test('accepts complete Supabase configuration', () {
    const config = AppConfig(
      supabaseUrl: 'https://example.supabase.co',
      supabaseAnonKey: 'anon-key',
    );

    expect(config.isSupabaseConfigured, isTrue);
    expect(config.missingSupabaseKeys, isEmpty);
  });
}
