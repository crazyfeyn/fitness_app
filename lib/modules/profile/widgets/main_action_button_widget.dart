import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MainActionButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String labelText;
  final Widget? labelWidget;

  const MainActionButtonWidget({
    super.key,
    required this.onTap,
    required this.labelText,
    this.labelWidget,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: MyColors.limeYellowColor,
        ),
        child: Center(
          child: labelWidget ??
              Text(
                labelText,
                style: GoogleFonts.openSans(
                  color: MyColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
        ),
      ),
    );
  }
}