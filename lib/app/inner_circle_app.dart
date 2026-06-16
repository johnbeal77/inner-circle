import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'bootstrap/startup_error_screen.dart';
import 'bootstrap/supabase_bootstrap.dart';
import '../platform/auth/auth_gate.dart';

class InnerCircleApp extends StatelessWidget {
  const InnerCircleApp({
    required this.bootstrapResult,
    super.key,
  });

  final SupabaseBootstrapResult bootstrapResult;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inner Circle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF476A55)),
        useMaterial3: true,
      ),
      home: bootstrapResult.isReady
          ? const AuthGate()
          : StartupErrorScreen(bootstrapResult: bootstrapResult),
      routes: AppRoutes.routes,
    );
  }
}
