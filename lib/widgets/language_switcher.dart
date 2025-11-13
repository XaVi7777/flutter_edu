import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';

import '../providers/course_provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final courseProvider = context.watch<CourseProvider>();

    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      tooltip: l10n.language,
      onSelected: (Locale locale) {
        courseProvider.changeLocale(locale);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: const Locale('ru'),
          child: Row(
            children: [
              if (courseProvider.currentLocale.languageCode == 'ru')
                const Icon(Icons.check, size: 20),
              if (courseProvider.currentLocale.languageCode == 'ru')
                const SizedBox(width: 8),
              Text(l10n.russian),
            ],
          ),
        ),
        PopupMenuItem(
          value: const Locale('kk'),
          child: Row(
            children: [
              if (courseProvider.currentLocale.languageCode == 'kk')
                const Icon(Icons.check, size: 20),
              if (courseProvider.currentLocale.languageCode == 'kk')
                const SizedBox(width: 8),
              Text(l10n.kazakh),
            ],
          ),
        ),
      ],
    );
  }
}
