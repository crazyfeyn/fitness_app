import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';

class CustomListItemWidget extends StatelessWidget {
  final String title;
  final Color color;
  final IconData? icon;
  final VoidCallback onTap;

  const CustomListItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Divider(
            color: MyColors.arrowBackIconColor,
            thickness: 2,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    color: color,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  icon,
                  size: 15,
                  color: MyColors.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
