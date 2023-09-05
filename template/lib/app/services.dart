import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/app/get_it.dart';
import 'package:template/app/router.dart';
import 'package:template/features/authentication/services/fast_authentication_service.dart';
import 'package:template/features/monitoring/services/fast_analytics_service.dart';
import 'package:template/features/monitoring/services/fast_crash_service.dart';
import 'package:template/features/settings/services/settings_service.dart';
import 'package:template/features/subscriptions/services/fast_subscription_service.dart';

AppRouter get router => getIt.get<AppRouter>();
FastAnalyticsService get analyticsService => getIt.get<FastAnalyticsService>();
FastAuthenticationService get authenticationService => getIt.get<FastAuthenticationService>();
FastCrashService get crashService => getIt.get<FastCrashService>();
FastSubscriptionService get subscriptionService => getIt.get<FastSubscriptionService>();
SettingsService get settingsService => getIt.get<SettingsService>();
SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();