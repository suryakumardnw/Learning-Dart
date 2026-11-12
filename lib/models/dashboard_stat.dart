import 'package:flutter/material.dart';

/// A single headline metric rendered on the dashboard.
@immutable
class DashboardStat {
  const DashboardStat({
    required this.label,
    required this.value,
    required this.icon,
    this.caption,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? caption;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DashboardStat &&
            label == other.label &&
            value == other.value &&
            icon == other.icon &&
            caption == other.caption;
  }

  @override
  int get hashCode => Object.hash(label, value, icon, caption);
}
