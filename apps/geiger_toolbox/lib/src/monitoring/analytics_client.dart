abstract class AnalyticsClient {
  Future<void> trackScanWithoutProfile();
  Future<void> trackScanWithProfile();
  Future<void> trackTodosCreated();
  Future<void> trackTodosUpdated();
  Future<void> trackTodoCompleted(int completedCount);

}
