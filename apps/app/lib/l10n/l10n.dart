import 'package:flutter/widgets.dart';
import 'package:frappify/l10n/generated/app_localizations.dart';

export 'package:frappify/l10n/generated/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
