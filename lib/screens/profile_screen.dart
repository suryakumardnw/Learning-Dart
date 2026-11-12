import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/models/app_user.dart';
import 'package:surya_learning_dart/router/routes.dart';
import 'package:surya_learning_dart/services/auth_service.dart';
import 'package:surya_learning_dart/theme/app_spacing.dart';
import 'package:surya_learning_dart/utils/formatters.dart';
import 'package:surya_learning_dart/widgets/app_card.dart';
import 'package:surya_learning_dart/widgets/profile_avatar.dart';
import 'package:surya_learning_dart/widgets/settings_tile.dart';

/// Read-only profile view with shortcuts to editing and settings.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.user});

  final AppUser? user;

  Future<void> _signOut(BuildContext context) async {
    await authService.signOut();
    if (!context.mounted) return;
    context.goNamed(AppRoutes.loginName);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: authService,
      builder: (context, _) {
        final current = user ?? authService.currentUser;
        final theme = Theme.of(context);
        final joinedAt = current.joinedAt;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            actions: [
              IconButton(
                tooltip: 'Edit profile',
                onPressed: () => context.pushNamed(AppRoutes.editProfileName),
                icon: const Icon(Icons.edit_outlined),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Center(child: ProfileAvatar(name: current.name, radius: 48)),
              const SizedBox(height: AppSpacing.md),
              Text(
                current.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                current.role,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppCard(
                child: Column(
                  children: [
                    _InfoRow(
                      icon: Icons.mail_outline,
                      label: 'Email',
                      value: current.email,
                    ),
                    const Divider(height: AppSpacing.lg),
                    _InfoRow(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: current.phone.isEmpty ? 'Not set' : current.phone,
                    ),
                    const Divider(height: AppSpacing.lg),
                    _InfoRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Joined',
                      value: joinedAt == null
                          ? 'Not available'
                          : Formatters.formatDate(joinedAt),
                    ),
                  ],
                ),
              ),
              if (current.bio.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About me',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(current.bio, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              AppCard(
                child: Column(
                  children: [
                    SettingsTile(
                      icon: Icons.edit_outlined,
                      title: 'Edit profile',
                      onTap: () => context.pushNamed(AppRoutes.editProfileName),
                    ),
                    const Divider(height: 1),
                    SettingsTile(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () => context.pushNamed(AppRoutes.settingsName),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              OutlinedButton.icon(
                onPressed: () => _signOut(context),
                icon: const Icon(Icons.logout),
                label: const Text('Sign out'),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: theme.textTheme.bodySmall),
              const SizedBox(height: 2),
              Text(value, style: theme.textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
