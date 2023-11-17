import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@singleton
class AnalyticsServices {
  final FirebaseAnalytics _fireBaseAnalytics = FirebaseAnalytics.instance;
  // FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _fireBaseAnalytics);
  FirebaseAnalyticsObserver getObserver() => FirebaseAnalyticsObserver(analytics: _fireBaseAnalytics);

  Future setUserProperties(String loginId, String userRole) async {
    await _fireBaseAnalytics.setUserId(id: loginId);
    await _fireBaseAnalytics.setUserProperty(name: "user_role", value: userRole);
  }

  Future logEvents(String name, Map<String, Object> parameters) async {
    await _fireBaseAnalytics.logEvent(name: name, parameters: parameters);
  }
}
