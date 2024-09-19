import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/profile/widgets/custom_list_item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
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
          "SETTINGS",
          style: GoogleFonts.openSans(
            color: MyColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          CustomListItemWidget(
            title: "Units of Measure",
            onTap: () {},
            color: MyColors.whiteColor,
            icon: Icons.arrow_forward_ios,
          ),
          CustomListItemWidget(
            title: "Notifications",
            onTap: () {},
            color: MyColors.whiteColor,
            icon: Icons.arrow_forward_ios,
          ),
          CustomListItemWidget(
            title: "Language",
            onTap: () {},
            color: MyColors.whiteColor,
            icon: Icons.arrow_forward_ios,
          ),
          CustomListItemWidget(
            title: "Contact Us",
            onTap: () {},
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
