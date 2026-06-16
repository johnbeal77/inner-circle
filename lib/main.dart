import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/bootstrap/supabase_bootstrap.dart';
import 'app/config/app_config.dart';
import 'app/inner_circle_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = AppConfig.fromEnvironment();
  final bootstrapResult = await SupabaseBootstrap.initialize(config);

  runApp(
    ProviderScope(
      child: InnerCircleApp(bootstrapResult: bootstrapResult),
    ),
  );
}
