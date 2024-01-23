// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i30;

import '../features/authentication/services/authentication_service/appwrite_authentication_service.dart'
    as _i8;
import '../features/authentication/services/authentication_service/fast_authentication_service.dart'
    as _i6;
import '../features/authentication/services/authentication_service/firebase_authentication_service.dart'
    as _i7;
import '../features/authentication/services/authentication_service/pocketbase_authentication_service.dart'
    as _i9;
import '../features/authentication/services/authentication_service/supabase_authentication_service.dart'
    as _i10;
import '../features/authentication/services/user_service/appwrite_user_service.dart'
    as _i26;
import '../features/authentication/services/user_service/fast_user_service.dart'
    as _i25;
import '../features/authentication/services/user_service/firebase_user_service.dart'
    as _i29;
import '../features/authentication/services/user_service/pocketbase_user_service.dart'
    as _i28;
import '../features/authentication/services/user_service/supabase_user_service.dart'
    as _i27;
import '../features/feedback/services/appwrite_feedback_service.dart' as _i23;
import '../features/feedback/services/fast_feedback_service.dart' as _i20;
import '../features/feedback/services/firebase_feedback_service.dart' as _i21;
import '../features/feedback/services/pocketbase_feedback_service.dart' as _i22;
import '../features/feedback/services/supabase_feedback_service.dart' as _i24;
import '../features/monitoring/services/amplitude_analytics_service.dart'
    as _i5;
import '../features/monitoring/services/crash_service.dart' as _i19;
import '../features/monitoring/services/fast_analytics_service.dart' as _i4;
import '../features/monitoring/services/fast_crash_service.dart' as _i18;
import '../features/settings/services/settings_service.dart' as _i32;
import '../features/shared/services/connector_service/appwrite_connector_service.dart'
    as _i16;
import '../features/shared/services/connector_service/fast_connector_service.dart'
    as _i13;
import '../features/shared/services/connector_service/firebase_connector_service.dart'
    as _i15;
import '../features/shared/services/connector_service/pocketbase_connector_service.dart'
    as _i17;
import '../features/shared/services/connector_service/supabase_connector_service.dart'
    as _i14;
import '../features/shared/services/dialog_service.dart' as _i3;
import '../features/shared/services/modules.dart' as _i33;
import '../features/subscriptions/services/subscription_service.dart' as _i31;
import '../modules/chat/services/chat_service.dart' as _i12;
import '../modules/chat/services/fast_chat_service.dart' as _i11;

const String _firebase = 'firebase';
const String _appwrite = 'appwrite';
const String _pocketbase = 'pocketbase';
const String _supabase = 'supabase';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.DialogService>(() => _i3.DialogService());
  gh.singleton<_i4.FastAnalyticsService>(_i5.AmplitudeAnalyticsService());
  gh.singleton<_i6.FastAuthenticationService>(
    _i7.FirebaseAuthenticationService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i6.FastAuthenticationService>(
    _i8.AppwriteAuthenticationService(),
    registerFor: {_appwrite},
  );
  gh.singleton<_i6.FastAuthenticationService>(
    _i9.PocketBaseAuthenticationService(),
    registerFor: {_pocketbase},
  );
  gh.singleton<_i6.FastAuthenticationService>(
    _i10.SupabaseAuthenticationService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i11.FastChatService>(() => _i12.ChatService());
  gh.factory<_i13.FastConnectorService>(
    () => _i14.SupabaseConnectorService(),
    registerFor: {_supabase},
  );
  gh.factory<_i13.FastConnectorService>(
    () => _i15.FirebaseConnectorService(),
    registerFor: {_firebase},
  );
  gh.factory<_i13.FastConnectorService>(
    () => _i16.AppwriteConnectorService(),
    registerFor: {_appwrite},
  );
  gh.factory<_i13.FastConnectorService>(
    () => _i17.PocketBaseConnectorService(),
    registerFor: {_pocketbase},
  );
  gh.singleton<_i18.FastCrashService>(_i19.CrashService());
  gh.lazySingleton<_i20.FastFeedbackService>(
    () => _i21.FirebaseFeedbackService(),
    registerFor: {_firebase},
  );
  gh.lazySingleton<_i20.FastFeedbackService>(
    () => _i22.PocketBaseFeedbackService(),
    registerFor: {_pocketbase},
  );
  gh.lazySingleton<_i20.FastFeedbackService>(
    () => _i23.AppwriteFeedbackService(),
    registerFor: {_appwrite},
  );
  gh.lazySingleton<_i20.FastFeedbackService>(
    () => _i24.SupabaseFeedbackService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i25.FastUserService>(
    () => _i26.AppwriteUserservice(),
    registerFor: {_appwrite},
  );
  gh.lazySingleton<_i25.FastUserService>(
    () => _i27.SupabaseUserService(),
    registerFor: {_supabase},
  );
  gh.singleton<_i25.FastUserService>(
    _i28.PocketBaseUserService(),
    registerFor: {_pocketbase},
  );
  gh.lazySingleton<_i25.FastUserService>(
    () => _i29.FirebaseUserService(),
    registerFor: {_firebase},
  );
  await gh.factoryAsync<_i30.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.singleton<_i31.SubscriptionService>(_i31.SubscriptionService());
  gh.singleton<_i32.SettingsService>(_i32.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i33.RegisterModule {}
