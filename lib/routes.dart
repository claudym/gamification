import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/rewards_catalog_screen.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/reward_detail_screen.dart';
import 'screens/settings_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/dashboard': (context) => DashboardScreen(),
  '/rewards': (context) => RewardsCatalogScreen(),
  '/leaderboard': (context) => LeaderboardScreen(),
  '/rewardDetail': (context) => RewardDetailScreen(),
  '/settings': (context) => SettingsScreen(),
};
