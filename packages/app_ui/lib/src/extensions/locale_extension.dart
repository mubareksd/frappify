import 'package:flutter/material.dart';

/// Extension on [Locale] to get the full name of the locale.
extension LocaleEx on Locale {
  /// Returns the full name of the locale.
  Map<String, String> fullName() {
    switch (languageCode) {
      case 'aa':
        return {'primary': 'Afar', 'secondary': 'Afar'};

      case 'am':
        return {'primary': 'አማርኛ', 'secondary': 'Amharic'};

      case 'ar':
        return {'primary': 'عربي', 'secondary': 'Arabic'};

      case 'en':
        return {'primary': 'English', 'secondary': 'English'};

      case 'om':
        return {'primary': 'Oromiffa', 'secondary': 'Oromiffa'};

      case 'so':
        return {'primary': 'Somali', 'secondary': 'Somali'};

      case 'ti':
        return {'primary': 'ትግርኛ', 'secondary': 'Tigrigna'};
    }
    return {};
  }
}
