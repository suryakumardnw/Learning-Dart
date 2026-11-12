import 'package:flutter/material.dart';
import 'package:surya_learning_dart/utils/formatters.dart';

/// Circular initials avatar for the signed-in user.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.name,
    this.radius = 24,
    this.onTap,
  });

  final String name;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar = CircleAvatar(
      radius: radius,
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      child: Text(
        Formatters.initialsOf(name),
        style: TextStyle(
          fontSize: radius * 0.7,
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );

    if (onTap == null) return avatar;

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: avatar,
    );
  }
}
