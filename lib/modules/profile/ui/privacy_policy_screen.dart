import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
          "PRIVACY POLICY",
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
                "Lorem ipsum dolor sit amet\n\nConsectetur adipiscing elit. Natoque phasellus lobortis mattis cursus faucibus hac proin risus. Turpis phasellus massa ullamcorper volutpat. Ornare commodo non integer fermentum nisi, morbi id. Vel tortor mauris feugiat amet, maecenas facilisis risus, in faucibus. Vestibulum ullamcorper fames eget enim diam fames faucibus duis ac. Aliquam non tellus semper in dignissim nascetur venenatis lacus.\n\nLectus vel non varius interdum vel tellus sed mattis. Sit laoreet auctor arcu mauris tincidunt sociis tristique pharetra neque. Aliquam pharetra elementum nisl sapien. Erat nisl morbi eu dolor in. Sapien ut lacus dui libero morbi tristique.\n\nSit praesent mi, dolor, magna in pellentesque sollicitudin odio sed. Sit nibh aliquam enim ipsum lectus sem fermentum congue velit. Purus habitant odio in morbi aliquet velit pulvinar. Facilisis ut amet interdum pretium. Fames pretium eget orci facilisis mattis est libero facilisis ullamcorper. Est auctor amet egestas risus libero et. Auctor faucibus sit id fringilla vitae. Ac volutpat sodales tristique ut netus turpis.\n\nLorem ipsum dolor sit amet, consectetur ",
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
