abstract class FastAnalyticsService {
  Future<void> initialize();

  void updateUserProperties(Map<String, dynamic> userProperties);

  void updateUserId(String? userId);

  void updateVersionId(String? versionId);

  void logEvent(String eventName, {Map<String, dynamic>? eventProperties});
}
