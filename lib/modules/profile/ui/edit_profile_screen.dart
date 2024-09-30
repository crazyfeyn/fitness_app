import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/modules/profile/bloc/profile_bloc.dart';
import 'package:flutter_application/modules/profile/bloc/profile_events.dart';
import 'package:flutter_application/modules/profile/bloc/profile_states.dart';
import 'package:flutter_application/modules/profile/ui/widgets/main_action_button_widget.dart';
import 'package:flutter_application/modules/profile/ui/widgets/profile_detail_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocListener<ProfileBloc, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileUpdatedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile updated successfully!')),
            );
          } else if (state is ProfileErrorState) {
            print(state.error);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
        child: SingleChildScrollView(
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
                          image: AssetImage('assets/images/kakao.png'),
                          fit: BoxFit.cover,
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: MainActionButtonWidget(
          onTap: () {
            context.read<ProfileBloc>().add(
                  UpdateProfileEvent(
                    name: _nameController.text,
                  ),
                );
          },
          labelText: "Save",
        ),
      ),
    );
  }
}
