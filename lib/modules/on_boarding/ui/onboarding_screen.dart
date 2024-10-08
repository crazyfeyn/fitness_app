import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/modules/home/ui/home_screen.dart';
import 'package:flutter_application/modules/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter_application/modules/on_boarding/ui/widgets/indicator_widget.dart';
import 'package:flutter_application/modules/on_boarding/ui/widgets/onboarding_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import generated localization file

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  List<OnboardingWidget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      OnboardingWidget(
          imagePath: 'onboarding_first.png',
          text: AppLocalizations.of(context)!.onboarding_title_1),
      OnboardingWidget(
          imagePath: 'onboarding_second.png',
          text: AppLocalizations.of(context)!.onboarding_title_2),
      OnboardingWidget(
          imagePath: 'onboarding_third.png',
          text: AppLocalizations.of(context)!.onboarding_title_3),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A1F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 7),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  context.read<OnboardingCubit>().changePage(index);
                },
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IndicatorWidget(
              currentIndex: context.watch<OnboardingCubit>().currentIndex(),
              totalIndicators: pages.length),
          const SizedBox(height: 20),
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              if (context.read<OnboardingCubit>().currentIndex() != 2) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              inputUserName: FirebaseAuth
                                  .instance.currentUser?.displayName,
                            )));
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFFBC1D),
                borderRadius: BorderRadius.circular(27),
              ),
              width: 410,
              height: 55,
              child: Text(
                context.watch<OnboardingCubit>().currentIndex() != 2
                    ? AppLocalizations.of(context)!.next
                    : AppLocalizations.of(context)!.get_started,
                style: const TextStyle(
                  color: Color(0xFF373941),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
