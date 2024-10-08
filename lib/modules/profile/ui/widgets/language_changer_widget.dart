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
  int selectedIndex = LanguagesList.currentLanguageIndex;

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
          _buildLanguageOption(context, localizations.english, 'en', 0),
          _buildLanguageOption(context, localizations.uzbek, 'uz', 1),
          _buildLanguageOption(context, localizations.russian, 'ru', 2),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
      BuildContext context, String language, String localeCode, int index) {
    return ListTile(
      title: Text(
        language,
        style: GoogleFonts.openSans(
          color: MyColors.whiteColor,
          fontSize: 16,
        ),
      ),
      trailing: selectedIndex == index
          ? const Icon(Icons.check, color: MyColors.whiteColor)
          : null,
      onTap: () {
        setState(() {
          selectedIndex = index;
          LanguagesList.currentLanguageIndex = selectedIndex;
        });

        Provider.of<LocaleProvider>(context, listen: false)
            .setLocale(Locale(localeCode));

        Navigator.of(context).pop();
        widget.onLanguageSelected();
      },
    );
  }
}
