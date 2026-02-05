import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/src/widgets_localizations.dart';

class _TiWidgetsLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const _TiWidgetsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ti';

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    return SynchronousFuture<WidgetsLocalizations>(
      const TiWidgetsLocalization(),
    );
  }

  @override
  bool shouldReload(_TiWidgetsLocalizationsDelegate old) => false;
}

class TiWidgetsLocalization extends GlobalWidgetsLocalizations {
  /// Create an instance of the translation bundle for Afar.
  ///
  /// For details on the meaning of the arguments, see [GlobalWidgetsLocalizations].
  const TiWidgetsLocalization() : super(TextDirection.ltr);

  @override
  String get reorderItemDown => 'ወደ ታች ውሰድ';

  @override
  String get reorderItemLeft => 'ወደ ግራ ውሰድ';

  @override
  String get reorderItemRight => 'ወደ ቀኝ ውሰድ';

  @override
  String get reorderItemToEnd => 'ወደ መጨረሻ ውሰድ';

  @override
  String get reorderItemToStart => 'ወደ መጀመሪያ ውሰድ';

  @override
  String get reorderItemUp => 'ወደ ላይ ውሰድ';

  static const LocalizationsDelegate<WidgetsLocalizations> delegate =
      _TiWidgetsLocalizationsDelegate();

  @override
  String get copyButtonLabel => 'ቅዳ';

  @override
  String get cutButtonLabel => 'ቁረጥ';

  @override
  String get lookUpButtonLabel => 'ይመልከቱ';

  @override
  String get pasteButtonLabel => 'ለጥፍ';

  @override
  String get searchWebButtonLabel => 'ድርን ፈልግ';

  @override
  String get selectAllButtonLabel => 'ሁሉንም ምረጥ';

  @override
  String get shareButtonLabel => 'አጋራ';

  @override
  String get noResultsFound => 'ምንም ተተኪዎች አልተገኙም';

  @override
  String get searchResultsFound => 'ፍለጋ የሚገኙት ተተኪዎች';

  @override
  String get radioButtonUnselectedLabel => 'unselected';
}
