import 'package:flutter/widgets.dart';

import '../modules/game_night/game_hat/game_hat_screen.dart';
import '../modules/game_night/game_night_screen.dart';
import 'app_shell.dart';

class AppRoutes {
  const AppRoutes._();

  static const circleHome = '/';
  static const gameNight = '/game-night';
  static const gameHat = '/game-night/game-hat';

  static Map<String, WidgetBuilder> get routes => {
        gameNight: (_) => const AppShell(child: GameNightScreen()),
        gameHat: (_) => const AppShell(child: GameHatScreen()),
      };
}
