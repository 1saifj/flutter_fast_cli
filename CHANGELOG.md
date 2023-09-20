## 1.3.2
- 🟪 Fixed missing runConfigurations directory
- *Date:* 9-20-2023

## 1.3.1
- 🟪 Error handling for missing runConfigurations directory
- *Date:* 9-20-2023

## 1.3.0
- 🟩 Added --offline argument to `fast app` command
- 🟩 Added empty .env file to ios fastlane directory
- 🟩 Wrapped Drawer contents in SafeArea
- 🟪 Added error handling for missing Amplitude API key
- *Date:* 9-20-2023

## 1.2.1
- 🟩 Added workaround for [this Fastlane issue](https://github.com/fastlane/fastlane/issues/21507)
- 🟪 Fixed scripts not being copied into new app
- 🟪 Fixed run configurations not being copied into new app
- 🟪 Added error output when `fast build` fails
- *Date:* 9-19-2023

## 1.2.0
- 🟩 Added `wizard` command
- 🟪 Fixed background color in subscription popup
- *Date:* 9-18-2023

## 1.1.4
- 🟪 Fixed generator so it creates `config.json` in assets folder
- *Date:* 9-17-2023

## 1.1.3
- 🟥 Removed state management library
- 🟥 Removed unnecessary Home tile in side drawer
- 🟩 Added bottom navigation bar on HomeView
- *Date:* 9-17-2023

## 1.1.2
- 🟩 Added option to generate ColorScheme from image (-l)
- 🟩 Added step to remove feature tags from lib directory (ex. //* Firebase *//)
- 🟩 Added basic Monarch stories for onboarding pages
- 🟨 Updated onboarding pages to have title and subtitle with animation
- 🟪 Fixed contrast issue in FeatureTile text
- *Date:* 9-16-2023

## 1.1.1
- 🟪 Fixed crash when running `fast app` with -p firebase flag
- *Date:* 9-15-2023

## 1.1.0
- 🟩 Added Appwrite support
- 🟩 Added Shorebird Fastlanes
- 🟩 Added `fast build` command
- 🟨 Updated default app icon
- *Date:* 9-15-2023

## 1.0.6
- 🟪 Fixed CLI for Windows (thanks @carmas123)
- *Date:* 9-13-2023

## 1.0.5
- 🟩 Added runWithProgress utility function
- 🟪 Fixed exception when clean command is used outside of Flutter project
- *Date:* 9-10-2023

## 1.0.4
- 🟩 Added "clean" command to deep clean Flutter projects
- *Date:* 9-10-2023

## 1.0.3
- 🟩 Android release signing setup with empty key.properties
- 🟩 Added Android Studio run configuration and VS code launch.json file
- 🟩 Added basic Flutter scripts
- 🟨 Moved existing Android Studio run configurations into template path. No more manually updating paths
- 🟪 Fixed how BuildContext was acquired in FastColor extension
- *Date:* 9-09-2023

## 1.0.2
- 🟥 Removed dependency on uuid package for Supabase builds
- 🟩 Created DashboardView as new default widget on home page
- 🟩 FastColor extension for accessing ColorScheme colors
- 🟩 Added MacOS entry to flutter_launcher_icons
- 🟨 Updated template name and org to flutterfast and com.cotr, respectively
- 🟨 Changed flutter_icons to flutter_launcher_icons in pubspec.yaml
- *Date:* 9-08-2023

## 1.0.1
- 🟩 Added --subs (and --no-subs) flag to turn the subscriptions feature off
- 🟩 Added --build (and --no-build) flag to turn off build step in app generation
- 🟨 Improved the built-in SubscriptionsView to handle any Offering setup in RevenueCat
- *Date:* 9-07-2023

## 1.0.0
- 🟩 Initial pre-release
- *Date:* 9-06-2023

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

# Types of Changes
- 🟩 Added
- 🟨 Changed
- 🟧 Deprecated
- 🟥 Removed
- 🟪 Fixed
- 🟦 Security