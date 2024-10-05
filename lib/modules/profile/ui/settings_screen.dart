import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/profile/ui/widgets/custom_list_item_widget.dart';
import 'package:flutter_application/modules/profile/ui/widgets/language_changer_widget.dart';
import 'package:flutter_application/modules/profile/ui/widgets/telegram_modal_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        backgroundColor: MyColors.backgroundColor,
        leading: IconButton.filled(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.arrowBackIconColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.whiteColor,
          ),
        ),
        title: Text(
          localizations.settings,
          style: GoogleFonts.openSans(
            color: MyColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          CustomListItemWidget(
            title: localizations.language,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return LanguageChangerWidget(
                    onLanguageSelected: () {
                      setState(() {});
                    },
                  );
                },
              );
            },
            color: MyColors.whiteColor,
            icon: Icons.arrow_forward_ios,
          ),
          CustomListItemWidget(
            title: localizations.contact_us,
            onTap: () async => TelegramModalBottomSheet(context),
            color: MyColors.whiteColor,
            icon: Icons.arrow_forward_ios,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Divider(
              color: MyColors.arrowBackIconColor,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
