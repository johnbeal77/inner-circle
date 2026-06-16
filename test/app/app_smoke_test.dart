import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inner_circle/app/bootstrap/supabase_bootstrap.dart';
import 'package:inner_circle/app/inner_circle_app.dart';

void main() {
  testWidgets('shows a readable setup error when Supabase config is missing',
      (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: InnerCircleApp(
          bootstrapResult: SupabaseBootstrapResult.missingConfig([
            'SUPABASE_URL',
            'SUPABASE_ANON_KEY',
          ]),
        ),
      ),
    );

    expect(find.text('Inner Circle setup needed'), findsOneWidget);
    expect(find.textContaining('SUPABASE_URL'), findsNWidgets(2));
    expect(find.textContaining('SUPABASE_ANON_KEY'), findsNWidgets(2));
  });
}
