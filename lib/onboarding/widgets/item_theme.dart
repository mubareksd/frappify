import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappify/l10n/l10n.dart';
import 'package:frappify/settings/settings.dart';
import 'package:frappify/utils/utils.dart';

class ItemTheme extends StatelessWidget {
  const ItemTheme({required this.theme, required this.onTap, super.key});

  final String theme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final themeMap = {
      'System': ThemeMode.system,
      'Light': ThemeMode.light,
      'Dark': ThemeMode.dark,
    };

    return RadioListTile(
      onChanged: (_) => onTap(),
      value: theme,
      groupValue: mapThemeModeToString(
        context.read<SettingsBloc>().state.themeMode,
      ),
      title: Row(
        children: [
          Icon(size: 18, mapThemeModeToIcon(themeMap[theme])),
          const SizedBox(width: 10),
          Text(
            theme,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
