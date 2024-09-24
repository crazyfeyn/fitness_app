import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/auth/blocs/auth_bloc.dart';
import 'package:flutter_application/modules/auth/blocs/auth_events.dart';
import 'package:flutter_application/modules/auth/blocs/auth_states.dart';
import 'package:flutter_application/modules/profile/widgets/custom_list_item_widget.dart';
import 'package:flutter_application/modules/profile/widgets/custom_list_widget.dart';
import 'package:flutter_application/modules/profile/widgets/custom_subscription_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool isPro = false;

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
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 104,
                        height: 104,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isPro
                                ? MyColors.redColor
                                : const Color(0xffD0FD3E),
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
                                image: NetworkImage(
                                    "https://img.freepik.com/free-photo/close-up-young-person-barbeque_23-2149271990.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isPro)
                        Positioned(
                          right: -10,
                          bottom: 5,
                          child: Container(
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
                        ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: isPro
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 103,
                        child: VerticalDivider(
                          color: MyColors.arrowBackIconColor,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "joined",
                              style: GoogleFonts.openSans(
                                color: isPro
                                    ? MyColors.whiteColor
                                    : MyColors.arrowBackIconColor,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              isPro ? "2 mon ago" : "2 month ago",
                              style: GoogleFonts.openSans(
                                color: MyColors.whiteColor,
                                fontSize: 15,
                              ),
                            ),
                            const Gap(10),
                            if (isPro)
                              const CustomSubscriptionDetails(
                                membershipStatus: "Pro Member",
                                expirationDate: "Until 18 Jul 2024",
                                subscriptionDuration: "12 Months Subscription",
                                membershipColor: MyColors.redColor,
                                textColor: MyColors.whiteColor,
                              )
                            else
                              const Text(""),
                          ],
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
            if (!isPro)
              CustomSubscriptionWidget(
                onTap: () {},
              ),
            const Gap(20),
            CustomListItemWidget(
              color: MyColors.redColor,
              title: "Sign Out",
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
