import 'package:flutter/material.dart';
import 'package:surya_learning_dart/models/activity_item.dart';
import 'package:surya_learning_dart/models/app_user.dart';
import 'package:surya_learning_dart/models/dashboard_stat.dart';

/// Supplies dashboard content for the demo app.
class DashboardService {
  const DashboardService();

  /// Returns the stat tiles shown at the top of the dashboard.
  Future<List<DashboardStat>> fetchStats(AppUser user) async {
    return const [
      DashboardStat(
        label: 'Day streak',
        value: '12',
        icon: Icons.local_fire_department_outlined,
        caption: 'Keep it going',
      ),
      DashboardStat(
        label: 'Lessons done',
        value: '34',
        icon: Icons.menu_book_outlined,
        caption: 'This month',
      ),
      DashboardStat(
        label: 'Hours learned',
        value: '18.5',
        icon: Icons.schedule_outlined,
        caption: 'All time',
      ),
      DashboardStat(
        label: 'Quiz score',
        value: '92%',
        icon: Icons.emoji_events_outlined,
        caption: 'Average',
      ),
    ];
  }

  /// Returns the newest-first activity feed for the dashboard.
  Future<List<ActivityItem>> fetchActivity(AppUser user) async {
    final now = DateTime.now();
    return [
      ActivityItem(
        id: 'act-1',
        title: 'Finished "Null safety" lesson',
        subtitle: 'Dart Fundamentals',
        timestamp: now.subtract(const Duration(minutes: 25)),
        icon: Icons.check_circle_outline,
      ),
      ActivityItem(
        id: 'act-2',
        title: 'Scored 95% on a quiz',
        subtitle: 'Collections & Iterables',
        timestamp: now.subtract(const Duration(hours: 3)),
        icon: Icons.emoji_events_outlined,
      ),
      ActivityItem(
        id: 'act-3',
        title: 'Completed 3 exercises',
        subtitle: 'Functions and closures',
        timestamp: now.subtract(const Duration(days: 1)),
        icon: Icons.code_outlined,
      ),
      ActivityItem(
        id: 'act-4',
        title: 'Started a new course',
        subtitle: 'Flutter layout essentials',
        timestamp: now.subtract(const Duration(days: 3)),
        icon: Icons.play_circle_outline,
      ),
    ];
  }
}

/// App-wide dashboard service instance.
const DashboardService dashboardService = DashboardService();
