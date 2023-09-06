import 'dart:io';

import 'package:flutter_fast_cli/src/strings/services.dart';
import 'package:flutter_fast_cli/src/strings/theme.dart';

import '../../../strings/strings.dart';

Future<void> createUtils(String appName) async {
  var appDirectory = await Directory('app').create();

  File constantsFile = File('${appDirectory.path}/constants.dart');
  await constantsFile.writeAsString(constantsText, mode: FileMode.write);

  File servicesFile = File('${appDirectory.path}/services.dart');
  await servicesFile.writeAsString(getServicesText(appName), mode: FileMode.write);

  File getItFile = File('${appDirectory.path}/get_it.dart');
  await getItFile.writeAsString(getItText, mode: FileMode.write);

  File textThemeFile = File('${appDirectory.path}/text_theme.dart');
  await textThemeFile.writeAsString(getTextThemeText(appName), mode: FileMode.write);

  File themeFile = File('${appDirectory.path}/theme.dart');
  await themeFile.writeAsString(getThemeText(), mode: FileMode.write);
}