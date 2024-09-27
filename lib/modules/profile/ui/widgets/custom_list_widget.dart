import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/profile/ui/widgets/custom_list_item_widget.dart';

class CustomList extends StatelessWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, VoidCallback>> items = [
      {
        "Edit Profile": () =>
            Navigator.pushNamed(context, '/editProfileScreen'),
      },
      {
        "Privacy Policy": () =>
            Navigator.pushNamed(context, '/privacyPolicyScreen'),
      },
      {
        "Settings": () => Navigator.pushNamed(context, '/settingsScreen'),
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
