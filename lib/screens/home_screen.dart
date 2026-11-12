import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/models/activity_item.dart';
import 'package:surya_learning_dart/models/app_user.dart';
import 'package:surya_learning_dart/models/dashboard_stat.dart';
import 'package:surya_learning_dart/router/routes.dart';
import 'package:surya_learning_dart/services/auth_service.dart';
import 'package:surya_learning_dart/services/dashboard_service.dart';
import 'package:surya_learning_dart/theme/app_spacing.dart';
import 'package:surya_learning_dart/utils/formatters.dart';
import 'package:surya_learning_dart/widgets/activity_tile.dart';
import 'package:surya_learning_dart/widgets/app_card.dart';
import 'package:surya_learning_dart/widgets/profile_avatar.dart';
import 'package:surya_learning_dart/widgets/stat_tile.dart';

/// Signed-in landing screen with stats, quick actions, and recent activity.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.user, this.dashboard = dashboardService});

  final AppUser? user;
  final DashboardService dashboard;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<_HomeData> _data;
  late AppUser _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user ?? authService.currentUser;
    _data = _load();
  }

  Future<_HomeData> _load() async {
    final results = await Future.wait([
      widget.dashboard.fetchStats(_user),
      widget.dashboard.fetchActivity(_user),
    ]);
    return _HomeData(
      stats: results[0] as List<DashboardStat>,
      activity: results[1] as List<ActivityItem>,
    );
  }

  Future<void> _refresh() async {
    setState(() => _data = _load());
    await _data;
  }

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: ProfileAvatar(
              name: _user.name,
              radius: 18,
              onTap: () => context.pushNamed(AppRoutes.profileName),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<_HomeData>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return ListView(
                children: const [
                  SizedBox(height: 160),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }

            if (snapshot.hasError) {
              return ListView(
                children: [
                  const SizedBox(height: 160),
                  Center(
                    child: Text(
                      'Could not load your dashboard.',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              );
            }

            final data = snapshot.requireData;
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Text(
                  '$_greeting, ${Formatters.firstNameOf(_user.name)}',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Here is how your learning is going.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: AppSpacing.sm,
                  crossAxisSpacing: AppSpacing.sm,
                  childAspectRatio: 1.5,
                  children: [
                    for (final stat in data.stats) StatTile(stat: stat),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quick actions',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: AppCard(
                        onTap: () =>
                            context.pushNamed(AppRoutes.editProfileName),
                        child: const _QuickAction(
                          icon: Icons.edit_outlined,
                          label: 'Edit profile',
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: AppCard(
                        onTap: () => context.pushNamed(AppRoutes.settingsName),
                        child: const _QuickAction(
                          icon: Icons.settings_outlined,
                          label: 'Settings',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent activity',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.pushNamed(AppRoutes.profileName),
                      child: const Text('View profile'),
                    ),
                  ],
                ),
                AppCard(
                  child: Column(
                    children: [
                      for (var i = 0; i < data.activity.length; i++) ...[
                        ActivityTile(item: data.activity[i]),
                        if (i != data.activity.length - 1)
                          const Divider(height: AppSpacing.md),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _HomeData {
  const _HomeData({required this.stats, required this.activity});

  final List<DashboardStat> stats;
  final List<ActivityItem> activity;
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: AppSpacing.sm),
        Flexible(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
