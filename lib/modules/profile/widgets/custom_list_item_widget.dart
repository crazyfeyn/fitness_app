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
