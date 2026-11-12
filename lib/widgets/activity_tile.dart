import 'package:flutter/material.dart';
import 'package:surya_learning_dart/models/activity_item.dart';
import 'package:surya_learning_dart/theme/app_spacing.dart';
import 'package:surya_learning_dart/utils/formatters.dart';

/// One row in the dashboard activity feed.
class ActivityTile extends StatelessWidget {
  const ActivityTile({super.key, required this.item});

  final ActivityItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary.withAlpha(28),
        foregroundColor: theme.colorScheme.primary,
        child: Icon(item.icon, size: 20),
      ),
      title: Text(item.title, style: theme.textTheme.bodyLarge),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.xs),
        child: Text(
          '${item.subtitle} · ${Formatters.formatRelativeTime(item.timestamp)}',
          style: theme.textTheme.bodySmall,
        ),
      ),
    );
  }
}
