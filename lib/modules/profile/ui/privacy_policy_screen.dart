import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: MyColors.backgroundColor,
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
          AppLocalizations.of(context)!.privacy_policy,
          style: GoogleFonts.openSans(
            color: MyColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                AppLocalizations.of(context)!.privacy_policy_content,
                style: GoogleFonts.openSans(
                  color: MyColors.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
