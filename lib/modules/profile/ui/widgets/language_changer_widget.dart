import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/languages_list.dart';
import 'package:flutter_application/modules/profile/provider/locale_provider.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageChangerWidget extends StatefulWidget {
  final VoidCallback onLanguageSelected;

  const LanguageChangerWidget({super.key, required this.onLanguageSelected});

  @override
  State<LanguageChangerWidget> createState() => _LanguageChangerWidgetState();
}

class _LanguageChangerWidgetState extends State<LanguageChangerWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      color: MyColors.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            localizations.select_language,
            style: GoogleFonts.openSans(
              color: MyColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          _buildLanguageOption(context, localizations.english, 'en'),
          _buildLanguageOption(context, localizations.uzbek, 'uz'),
          _buildLanguageOption(context, localizations.russian, 'ru'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
      BuildContext context, String language, String localeCode) {
    return ListTile(
      title: Text(
        language,
        style: GoogleFonts.openSans(
          color: MyColors.whiteColor,
          fontSize: 16,
        ),
      ),
      onTap: () {
        int selectedIndex = LanguagesList.languagesList.indexOf(localeCode);
        if (selectedIndex != -1) {
          setState(() {
            LanguagesList.currentLanguageIndex = selectedIndex;
          });

          Provider.of<LocaleProvider>(context, listen: false)
              .setLocale(Locale(localeCode));

          Navigator.of(context).pop();
          widget.onLanguageSelected();
        }
      },
    );
  }
}
