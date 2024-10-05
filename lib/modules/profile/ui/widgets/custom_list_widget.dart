import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/profile/ui/widgets/custom_list_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomList extends StatelessWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, VoidCallback>> items = [
      {
        AppLocalizations.of(context)!.edit_profile: () =>
            Navigator.pushNamed(context, '/editProfileScreen'),
      },
      {
        AppLocalizations.of(context)!.privacy_policy: () =>
            Navigator.pushNamed(context, '/privacyPolicyScreen'),
      },
      {
        AppLocalizations.of(context)!.settings: () =>
            Navigator.pushNamed(context, '/settingsScreen'),
      },
    ];

    return Column(
      children: items.map((item) {
        final title = item.keys.first;
        final onTap = item[title]!;
        return CustomListItemWidget(
          color: MyColors.whiteColor,
          title: title,
          onTap: onTap,
          icon: Icons.arrow_forward_ios,
        );
      }).toList(),
    );
  }
}
