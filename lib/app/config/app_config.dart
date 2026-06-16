class AppConfig {
  const AppConfig({
    required this.supabaseUrl,
    required this.supabaseAnonKey,
  });

  factory AppConfig.fromEnvironment() {
    return const AppConfig(
      supabaseUrl: String.fromEnvironment('SUPABASE_URL'),
      supabaseAnonKey: String.fromEnvironment('SUPABASE_ANON_KEY'),
    );
  }

  final String supabaseUrl;
  final String supabaseAnonKey;

  bool get isSupabaseConfigured =>
      supabaseUrl.trim().isNotEmpty && supabaseAnonKey.trim().isNotEmpty;

  List<String> get missingSupabaseKeys {
    return [
      if (supabaseUrl.trim().isEmpty) 'SUPABASE_URL',
      if (supabaseAnonKey.trim().isEmpty) 'SUPABASE_ANON_KEY',
    ];
  }
}
