import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/src/cupertino_localizations.dart';
import 'package:intl/intl.dart' as intl;

class _AaCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _AaCupertinoLocalizationsDelegate();

  @override
  bool isSupported(final Locale locale) => locale.languageCode == 'aa';

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    final localeName = intl.Intl.canonicalizedLocale(locale.toString());
    return SynchronousFuture<CupertinoLocalizations>(AaCupertinoLocalization(
      localeName: localeName,
      dayFormat: intl.DateFormat('y', localeName),
      decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
      doubleDigitMinuteFormat: intl.DateFormat('y', localeName),
      fullYearFormat: intl.DateFormat('y', localeName),
      mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
      singleDigitHourFormat: intl.DateFormat('y', localeName),
      singleDigitMinuteFormat: intl.DateFormat('y', localeName),
      singleDigitSecondFormat: intl.DateFormat('y', localeName),
      weekdayFormat: intl.DateFormat('y', localeName),
    ),);
  }

  @override
  bool shouldReload(_AaCupertinoLocalizationsDelegate old) => false;
}

class AaCupertinoLocalization extends GlobalCupertinoLocalizations {
  /// Create an instance of the translation bundle for Afar.
  ///
  /// For details on the meaning of the arguments, see [GlobalCupertinoLocalizations].
  const AaCupertinoLocalization({
    required super.fullYearFormat,
    required super.dayFormat,
    required super.weekdayFormat,
    required super.mediumDateFormat,
    required super.singleDigitHourFormat,
    required super.singleDigitMinuteFormat,
    required super.doubleDigitMinuteFormat,
    required super.singleDigitSecondFormat,
    required super.decimalFormat,
    super.localeName = 'aa',
  });

  @override
  String get alertDialogLabel => 'ማንቂያ';

  @override
  String get anteMeridiemAbbreviation => 'ጥዋት';

  @override
  String get clearButtonLabel => 'አጽዳ';

  @override
  String get copyButtonLabel => 'ቅዳ';

  @override
  String get cutButtonLabel => 'ቁረጥ';

  @override
  String get datePickerDateOrderString => 'dmy';

  @override
  String get datePickerDateTimeOrderString => 'date_time_dayPeriod';

  @override
  String? get datePickerHourSemanticsLabelFew => null;

  @override
  String? get datePickerHourSemanticsLabelMany => null;

  @override
  String? get datePickerHourSemanticsLabelOne => r'$hour ሰዓት';

  @override
  String get datePickerHourSemanticsLabelOther => r'$hour ሰዓት';

  @override
  String? get datePickerHourSemanticsLabelTwo => null;

  @override
  String? get datePickerHourSemanticsLabelZero => null;

  @override
  String? get datePickerMinuteSemanticsLabelFew => null;

  @override
  String? get datePickerMinuteSemanticsLabelMany => null;

  @override
  String? get datePickerMinuteSemanticsLabelOne => '1 ደቂቃ';

  @override
  String get datePickerMinuteSemanticsLabelOther => r'$minute ደቂቃዎች';

  @override
  String? get datePickerMinuteSemanticsLabelTwo => null;

  @override
  String? get datePickerMinuteSemanticsLabelZero => null;

  @override
  String get lookUpButtonLabel => 'ይመልከቱ';

  @override
  String get menuDismissLabel => 'ምናሌን አሰናብት';

  @override
  String get modalBarrierDismissLabel => 'አሰናብት';

  @override
  String get noSpellCheckReplacementsLabel => 'ምንም ተተኪዎች አልተገኙም';

  @override
  String get pasteButtonLabel => 'ለጥፍ';

  @override
  String get postMeridiemAbbreviation => 'ከሰዓት';

  @override
  String get searchTextFieldPlaceholderLabel => 'ፍለጋ';

  @override
  String get searchWebButtonLabel => 'ድርን ፈልግ';

  @override
  String get selectAllButtonLabel => 'ሁሉንም ምረጥ';

  @override
  String get shareButtonLabel => 'አጋራ...';

  @override
  String get tabSemanticsLabelRaw => r'ትር $tabIndex ከ$tabCount';

  @override
  String? get timerPickerHourLabelFew => null;

  @override
  String? get timerPickerHourLabelMany => null;

  @override
  String? get timerPickerHourLabelOne => 'ሰዓት';

  @override
  String get timerPickerHourLabelOther => 'ሰዓቶች';

  @override
  String? get timerPickerHourLabelTwo => null;

  @override
  String? get timerPickerHourLabelZero => null;

  @override
  String? get timerPickerMinuteLabelFew => null;

  @override
  String? get timerPickerMinuteLabelMany => null;

  @override
  String? get timerPickerMinuteLabelOne => 'ደቂቃ';

  @override
  String get timerPickerMinuteLabelOther => 'ደቂቃ';

  @override
  String? get timerPickerMinuteLabelTwo => null;

  @override
  String? get timerPickerMinuteLabelZero => null;

  @override
  String? get timerPickerSecondLabelFew => null;

  @override
  String? get timerPickerSecondLabelMany => null;

  @override
  String? get timerPickerSecondLabelOne => 'ሴኮ';

  @override
  String get timerPickerSecondLabelOther => 'ሴኮ';

  @override
  String? get timerPickerSecondLabelTwo => null;

  @override
  String? get timerPickerSecondLabelZero => null;

  @override
  String get todayLabel => 'ዛሬ';

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _AaCupertinoLocalizationsDelegate();
      
        @override
        // TODO: implement backButtonLabel
        String get backButtonLabel => throw UnimplementedError();
      
        @override
        // TODO: implement cancelButtonLabel
        String get cancelButtonLabel => throw UnimplementedError();
}
