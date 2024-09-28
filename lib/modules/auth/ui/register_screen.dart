import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/theme/colors.dart';
import 'package:flutter_application/core/utils/validators.dart';
import 'package:flutter_application/modules/auth/blocs/auth_bloc.dart';
import 'package:flutter_application/modules/auth/blocs/auth_events.dart';
import 'package:flutter_application/modules/auth/blocs/auth_states.dart';
import 'package:flutter_application/modules/auth/ui/widgets/auth_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final passwordAgainFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordAgainFocusNode.dispose();
    super.dispose();
  }

  Future<void> _onTapRegister() async {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        AuthRegisterEvent(emailController.text, passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.47,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/onboarding_first.png'),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello rookies,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Enter your informations below or login with a other account",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticated) {
                    Navigator.pushReplacementNamed(context, '/userInfoScreen',
                        arguments: {
                          'email': emailController.text,
                          'password': passwordController.text,
                        });
                  } else if (state is AuthUnauthenticated) {
                    Navigator.pushReplacementNamed(context, '/registerScreen');
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: Column(
                  children: [
                    AuthTextField(
                      controller: emailController,
                      label: "Email",
                      validator: Validator.validateEmail,
                      focusNode: emailFocusNode,
                    ),
                    AuthTextField(
                      controller: passwordController,
                      label: "Password",
                      isObscurely: true,
                      textInputType: TextInputType.visiblePassword,
                      validator: Validator.validatePassword,
                      focusNode: passwordFocusNode,
                    ),
                    AuthTextField(
                      controller: passwordAgainController,
                      isObscurely: true,
                      label: "Password again",
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) => Validator.validateConfirmPassword(
                          value, passwordController.text),
                      focusNode: passwordAgainFocusNode,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        overlayColor: MyColors.blackColor,
                        fixedSize: const Size(145, 50),
                        backgroundColor: MyColors.limeYellowColor,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Back to login",
                            style: TextStyle(
                              color: MyColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        overlayColor: MyColors.blackColor,
                        fixedSize: const Size(145, 50),
                        backgroundColor: MyColors.limeYellowColor,
                      ),
                      onPressed: _onTapRegister,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: MyColors.blackColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios_sharp)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
