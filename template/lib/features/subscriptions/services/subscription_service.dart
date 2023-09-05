import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:template/app/constants.dart';
import 'package:template/app/router.dart';
import 'dart:io' show Platform;

import 'package:template/app/services.dart';
import 'package:template/features/subscriptions/services/fast_subscription_service.dart';

@Singleton(as: FastSubscriptionService)
class SubscriptionService extends FastSubscriptionService {
  @override
  String premiumId = 'premium';

  Package? monthly;
  Package? annual;

  @override
  Future<void> initialize() async {
    await Purchases.setLogLevel(LogLevel.debug);

    late PurchasesConfiguration configuration;

    if (Platform.isAndroid && const String.fromEnvironment('GOOGLE_SDK_KEY').isNotEmpty) {
      // use your preferred way to determine if this build is for Amazon store
      // checkout our MagicWeather sample for a suggestion
      // configuration = AmazonConfiguration(const String.fromEnvironment('amazon_sdk_key'));
      configuration = PurchasesConfiguration(const String.fromEnvironment('GOOGLE_SDK_KEY'));
    } else if (Platform.isIOS && const String.fromEnvironment('IOS_SDK_KEY').isNotEmpty) {
      configuration = PurchasesConfiguration(const String.fromEnvironment('IOS_SDK_KEY'));
    } else {
      return;
    }

    await Purchases.configure(configuration..appUserID = FirebaseAuth.instance.currentUser?.uid);

    await checkSubscription();

    Purchases.addCustomerInfoUpdateListener((purchaserInfo) {
      debugPrint('purchaserInfo.activeSubscriptions: ${purchaserInfo.activeSubscriptions}');
      debugPrint('purchaserInfo.entitlements.all: ${purchaserInfo.entitlements.all}');
      debugPrint('purchaserInfo.entitlements.active: ${purchaserInfo.entitlements.active}');
      debugPrint('purchaserInfo.entitlements.all[_premiumId]: ${purchaserInfo.entitlements.all[premiumId]}');
      debugPrint('purchaserInfo.allExpirationDates: ${purchaserInfo.allExpirationDates}');
      // handle any changes to purchaserInfo
      if (purchaserInfo.entitlements.all[premiumId]?.isActive ?? false) {
        setPremium(purchaserInfo.entitlements.all[premiumId]?.isActive ?? false);
      }
    });
  }

  @override
  Future<void> checkSubscription() async {
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      if (customerInfo.entitlements.all[premiumId]?.isActive ?? false) {
        // Grant user "pro" access
        setPremium(true);
      }
    } on PlatformException catch (e) {
      // Error fetching purchaser info
      setPremium(false);
    }
  }

  @override
  Future<void> showPremiumPopup() async {
    await showModalBottomSheet(
      context: router.navigatorKey.currentContext!,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: .7,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Icon(
                      Icons.lock,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                ),
                const Text('You need to be a premium member to access this feature.'),
                gap16,
                OutlinedButton(
                  onPressed: () {
                    router.pop();
                    router.push(const SubscriptionRoute());
                  },
                  child: const Text('Subscribe'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> purchaseMonthlySubscription() async {
    if (monthly == null) return;
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(monthly!);
      var isPremium = customerInfo.entitlements.all[premiumId]?.isActive ?? false;
      if (isPremium) {
        setPremium(true);
      }
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        // showError(e);
      }
    }
  }

  @override
  Future<void> purchaseAnnualSubscription() async {
    if (annual == null) return;
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(annual!);
      var isPremium = customerInfo.entitlements.all[premiumId]?.isActive ?? false;
      if (isPremium) {
        setPremium(true);
      }
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        // showError(e);
      }
    }
  }

  @override
  Future<void> fetchOfferings() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        monthly = offerings.current!.monthly;
        annual = offerings.current!.annual;
      }
    } on PlatformException catch (e) {
      // optional error handling
    }
  }
}
