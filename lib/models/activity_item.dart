import 'package:flutter/material.dart';

/// A timestamped entry in the user's learning activity feed.
@immutable
class ActivityItem {
  const ActivityItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.icon,
  });

  final String id;
  final String title;
  final String subtitle;
  final DateTime timestamp;
  final IconData icon;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ActivityItem &&
            id == other.id &&
            title == other.title &&
            subtitle == other.subtitle &&
            timestamp == other.timestamp &&
            icon == other.icon;
  }

  @override
  int get hashCode => Object.hash(id, title, subtitle, timestamp, icon);
}
