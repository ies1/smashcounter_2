import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class FirebaseProvider {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> sendAnalyticsEvent(String type, String message) async {
    await analytics.logEvent(
      name: type,
      parameters: <String, dynamic>{
        'string': message
      },
    );
  }

  Future<void> logAppOpen() async {
    await analytics.logAppOpen();
  }
}