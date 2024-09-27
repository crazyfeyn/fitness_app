import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubscriptionWidget extends StatelessWidget {
  final VoidCallback onTap;

  const CustomSubscriptionWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: 327,
        height: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.arrowBackIconColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 37,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: MyColors.redColor,
                ),
                child: Center(
                  child: Text(
                    "PRO",
                    style: GoogleFonts.openSans(
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const Gap(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upgrade to Premium",
                    style: GoogleFonts.openSans(
                      color: MyColors.whiteColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: MyColors.whiteColor,
                    ),
                  ),
                ],
              ),
              const Gap(2),
              Text(
                "This subscription is auto-renewable",
                style: GoogleFonts.openSans(
                  color: MyColors.whiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSubscriptionDetails extends StatelessWidget {
  final String membershipStatus;
  final String expirationDate;
  final String subscriptionDuration;
  final Color membershipColor;
  final Color textColor;

  const CustomSubscriptionDetails({
    super.key,
    required this.membershipStatus,
    required this.expirationDate,
    required this.subscriptionDuration,
    required this.membershipColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          membershipStatus,
          style: GoogleFonts.openSans(
            color: membershipColor,
            fontSize: 11,
          ),
        ),
        Text(
          expirationDate,
          style: GoogleFonts.openSans(
            color: textColor,
            fontSize: 15,
          ),
        ),
        Text(
          subscriptionDuration,
          style: GoogleFonts.openSans(
            color: textColor,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}