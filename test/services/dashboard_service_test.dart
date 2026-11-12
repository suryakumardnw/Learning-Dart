import 'package:flutter_test/flutter_test.dart';
import 'package:surya_learning_dart/services/auth_service.dart';
import 'package:surya_learning_dart/services/dashboard_service.dart';

void main() {
  const service = DashboardService();
  final user = AuthService.demoUser;

  test('fetchStats returns the four dashboard metrics', () async {
    final stats = await service.fetchStats(user);

    expect(stats, hasLength(4));
    expect(stats.map((stat) => stat.label), contains('Day streak'));
    expect(stats.map((stat) => stat.label), contains('Quiz score'));
  });

  test('fetchActivity returns a newest-first feed', () async {
    final activity = await service.fetchActivity(user);

    expect(activity, hasLength(4));
    for (var i = 1; i < activity.length; i++) {
      expect(
        activity[i].timestamp.isBefore(activity[i - 1].timestamp),
        isTrue,
        reason: 'Activity item $i should be older than item ${i - 1}',
      );
    }
  });

  test('fetchActivity includes the user-agnostic demo entries', () async {
    final activity = await service.fetchActivity(user);

    expect(activity.first.title, 'Finished "Null safety" lesson');
  });
}
