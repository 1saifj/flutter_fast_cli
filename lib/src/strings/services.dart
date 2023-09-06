String getServicesText(String appName){

  appName = appName.toLowerCase();
  return '''
import 'package:shared_preferences/shared_preferences.dart';
import 'package:$appName/app/get_it.dart';
import 'package:$appName/app/router.dart';
import 'package:$appName/features/authentication/services/fast_authentication_service.dart';
import 'package:$appName/features/authentication/services/fast_user_service.dart';
import 'package:$appName/features/home/services/fast_chat_service.dart';
import 'package:$appName/features/monitoring/services/fast_analytics_service.dart';
import 'package:$appName/features/monitoring/services/fast_crash_service.dart';
import 'package:$appName/features/settings/services/settings_service.dart';
import 'package:$appName/features/subscriptions/services/subscription_service.dart';

AppRouter get router => getIt.get<AppRouter>();
FastAnalyticsService get analyticsService => getIt.get<FastAnalyticsService>();
FastAuthenticationService get authenticationService => getIt.get<FastAuthenticationService>();
FastChatService get chatService => getIt.get<FastChatService>();
FastCrashService get crashService => getIt.get<FastCrashService>();
FastUserService get userService => getIt.get<FastUserService>();
SubscriptionService get subscriptionService => getIt.get<SubscriptionService>();
SettingsService get settingsService => getIt.get<SettingsService>();
SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();
  ''';
}