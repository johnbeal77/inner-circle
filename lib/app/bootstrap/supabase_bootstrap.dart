import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/app_config.dart';

class SupabaseBootstrapResult {
  const SupabaseBootstrapResult.ready()
      : missingConfigKeys = const [],
        error = null;

  const SupabaseBootstrapResult.missingConfig(this.missingConfigKeys)
      : error = null;

  const SupabaseBootstrapResult.failed(this.error)
      : missingConfigKeys = const [];

  final List<String> missingConfigKeys;
  final Object? error;

  bool get isReady => missingConfigKeys.isEmpty && error == null;
}

class SupabaseBootstrap {
  const SupabaseBootstrap._();

  static Future<SupabaseBootstrapResult> initialize(AppConfig config) async {
    if (!config.isSupabaseConfigured) {
      return SupabaseBootstrapResult.missingConfig(config.missingSupabaseKeys);
    }

    try {
      await Supabase.initialize(
        url: config.supabaseUrl,
        publishableKey: config.supabaseAnonKey,
      );

      return const SupabaseBootstrapResult.ready();
    } catch (error) {
      return SupabaseBootstrapResult.failed(error);
    }
  }
}
