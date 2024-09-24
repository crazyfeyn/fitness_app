import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/profile/widgets/main_action_button_widget.dart';
import 'package:flutter_application/modules/profile/widgets/profile_detail_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "Sarah Wegan");
  final TextEditingController _emailController =
      TextEditingController(text: "Sarah145@mail.com");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
            Navigator.pushNamed(context, '/profileScreen');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.whiteColor,
          ),
        ),
        title: Text(
          "EDIT PROFILE",
          style: GoogleFonts.openSans(
            color: MyColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 40),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.arrowBackIconColor,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/close-up-young-person-barbeque_23-2149271990.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -12,
                    bottom: 0,
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.arrowBackIconColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/icons/camera.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProfileDetailWidget(
              label: "Name",
              initialValue: _nameController.text,
              onChanged: (value) {
                _nameController.text = value;
              },
            ),
            ProfileDetailWidget(
              label: "Email",
              initialValue: _emailController.text,
              onChanged: (value) {
                _emailController.text = value;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: MyColors.arrowBackIconColor,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: MainActionButtonWidget(
          onTap: () {
            print('Name: ${_nameController.text}');
            print('Email: ${_emailController.text}');
          },
          labelText: "Save",
        ),
      ),
    );
  }
}
