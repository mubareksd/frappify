import 'dart:io';

import 'package:flutter/foundation.dart';

final bool kIsDesktop = kIsLinux || kIsWindows || kIsMacOS;

final bool kIsMobile = kIsAndroid || kIsIOS;

final bool kIsFlatpak = !kIsWeb && Platform.environment['FLATPAK_ID'] != null;

final bool kIsMacOS = !kIsWeb && Platform.isMacOS;

final bool kIsLinux = !kIsWeb && Platform.isLinux;
final bool kIsAndroid = !kIsWeb && Platform.isAndroid;
final bool kIsIOS = !kIsWeb && Platform.isIOS;
final bool kIsWindows = !kIsWeb && Platform.isWindows;
