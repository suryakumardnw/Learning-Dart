/// Small formatting helpers used by the profile and dashboard UI.
abstract final class Formatters {
  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Returns the first word of [name], or "Learner" when empty.
  static String firstNameOf(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return 'Learner';
    return trimmed.split(RegExp(r'\s+')).first;
  }

  /// Returns up to two uppercase initials for [name].
  static String initialsOf(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  /// Formats [date] as e.g. "Jan 15, 2025".
  static String formatDate(DateTime date) {
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Formats [time] relative to [now], falling back to an absolute date.
  static String formatRelativeTime(DateTime time, {DateTime? now}) {
    final reference = now ?? DateTime.now();
    final difference = reference.difference(time);

    if (difference.inSeconds < 60) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';
    return formatDate(time);
  }

  /// Formats a whole number with a compact "k" suffix when large enough.
  static String compactNumber(int value) {
    if (value.abs() < 1000) return '$value';
    final thousands = value / 1000;
    final text = thousands.toStringAsFixed(
      thousands.truncateToDouble() == thousands ? 0 : 1,
    );
    return '${text}k';
  }

  /// Capitalises the first letter of [value].
  static String capitalize(String value) {
    if (value.isEmpty) return value;
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }
}
