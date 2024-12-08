import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/rewards_catalog_screen.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/reward_detail_screen.dart';
import 'screens/settings_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/dashboard': (context) => const DashboardScreen(),
  '/rewards': (context) => const RewardsCatalogScreen(),
  '/leaderboard': (context) => const LeaderboardScreen(),
  '/rewardDetail': (context) => const RewardDetailScreen(),
  '/settings': (context) => const SettingsScreen(),
};
