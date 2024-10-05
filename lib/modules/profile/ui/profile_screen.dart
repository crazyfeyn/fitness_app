import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/auth/blocs/auth_bloc.dart';
import 'package:flutter_application/modules/auth/blocs/auth_events.dart';
import 'package:flutter_application/modules/profile/ui/widgets/custom_list_item_widget.dart';
import 'package:flutter_application/modules/profile/ui/widgets/custom_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 104,
                    height: 104,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffD0FD3E),
                        width: 3,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/kakao.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        height: 103,
                        child: VerticalDivider(
                          color: MyColors.arrowBackIconColor,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "SARAH\nWEGAN",
                style: GoogleFonts.openSans(
                  color: MyColors.whiteColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const CustomList(),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Divider(
                color: MyColors.arrowBackIconColor,
                thickness: 2,
              ),
            ),
            const Gap(20),
            CustomListItemWidget(
              color: MyColors.redColor,
              title: AppLocalizations.of(context)!.sign_out,
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
                Navigator.pushNamed(context, '/loginScreen');
              },
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Divider(
                color: MyColors.arrowBackIconColor,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
