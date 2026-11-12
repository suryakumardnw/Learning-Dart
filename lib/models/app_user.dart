import 'package:flutter/foundation.dart';

/// Immutable representation of the signed-in user.
@immutable
class AppUser {
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.phone = '',
    this.bio = '',
    this.role = 'Learner',
    this.joinedAt,
  });

  final String id;
  final String name;
  final String email;
  final String phone;
  final String bio;
  final String role;
  final DateTime? joinedAt;

  /// First word of the user's name, used in greetings.
  String get firstName {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return 'Learner';
    return trimmed.split(RegExp(r'\s+')).first;
  }

  /// Up to two uppercase letters used by [ProfileAvatar].
  String get initials {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? bio,
    String? role,
    DateTime? joinedAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      bio: bio ?? this.bio,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AppUser &&
            id == other.id &&
            name == other.name &&
            email == other.email &&
            phone == other.phone &&
            bio == other.bio &&
            role == other.role &&
            joinedAt == other.joinedAt;
  }

  @override
  int get hashCode => Object.hash(id, name, email, phone, bio, role, joinedAt);
}
