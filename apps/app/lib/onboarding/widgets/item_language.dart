import 'package:app_ui/app_ui.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class ItemLanguage extends StatelessWidget {
  const ItemLanguage({
    required this.selectedLan,
    required this.locale,
    required this.onTap,
    super.key,
  });

  final Locale locale;
  final Locale selectedLan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: locale,
      groupValue: selectedLan,
      onChanged: (_) => onTap(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CountryFlag.fromLanguageCode(
                locale.languageCode.contains('ar') ||
                        locale.languageCode.contains('en')
                    ? locale.languageCode
                    : 'am',
                shape: const RoundedRectangle(2),
                width: 25,
                height: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                locale.fullName()['primary'].toString(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            locale.fullName()['secondary'].toString(),
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
