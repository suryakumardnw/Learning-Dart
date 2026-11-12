import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/router/routes.dart';
import 'package:surya_learning_dart/services/auth_service.dart';
import 'package:surya_learning_dart/theme/app_spacing.dart';
import 'package:surya_learning_dart/widgets/app_card.dart';
import 'package:surya_learning_dart/widgets/settings_tile.dart';

/// Local-only preferences screen plus account actions.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _weeklyDigest = false;
  bool _soundEffects = true;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _signOut() async {
    await authService.signOut();
    if (!mounted) return;
    context.goNamed(AppRoutes.loginName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            'Notifications',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppCard(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Column(
              children: [
                SwitchListTile.adaptive(
                  value: _notifications,
                  onChanged: (value) => setState(() => _notifications = value),
                  secondary: const Icon(Icons.notifications_outlined),
                  title: const Text('Push notifications'),
                  subtitle: const Text('Reminders and lesson updates'),
                ),
                const Divider(height: 1),
                SwitchListTile.adaptive(
                  value: _weeklyDigest,
                  onChanged: (value) => setState(() => _weeklyDigest = value),
                  secondary: const Icon(Icons.mark_email_unread_outlined),
                  title: const Text('Weekly digest'),
                  subtitle: const Text('A summary every Monday'),
                ),
                const Divider(height: 1),
                SwitchListTile.adaptive(
                  value: _soundEffects,
                  onChanged: (value) => setState(() => _soundEffects = value),
                  secondary: const Icon(Icons.volume_up_outlined),
                  title: const Text('Sound effects'),
                  subtitle: const Text('Play sounds in exercises'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'More',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppCard(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy policy',
                  onTap: () => _showMessage('Privacy policy coming soon.'),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.info_outline,
                  title: 'About this app',
                  subtitle: 'Learning Dart · v1.0.0',
                  onTap: () => _showMessage('Surya Learning Dart v1.0.0'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          OutlinedButton.icon(
            onPressed: _signOut,
            icon: const Icon(Icons.logout),
            label: const Text('Sign out'),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
