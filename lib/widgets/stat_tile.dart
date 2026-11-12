import 'package:flutter/material.dart';
import 'package:surya_learning_dart/models/dashboard_stat.dart';
import 'package:surya_learning_dart/theme/app_spacing.dart';
import 'package:surya_learning_dart/widgets/app_card.dart';

/// A compact metric card shown in the dashboard grid.
class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.stat});

  final DashboardStat stat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final caption = stat.caption;

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(stat.icon, color: theme.colorScheme.primary),
          const Spacer(),
          Text(
            stat.value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            stat.label,
            style: theme.textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (caption != null)
            Text(
              caption,
              style: theme.textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
