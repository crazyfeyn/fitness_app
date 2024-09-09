import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailWidget extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(
            color: MyColors.arrowBackIconColor,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.openSans(
                  color: MyColors.limeYellowColor,
                  fontSize: 11,
                ),
              ),
              const Gap(5),
              Text(
                value,
                style: GoogleFonts.openSans(
                  color: MyColors.whiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}