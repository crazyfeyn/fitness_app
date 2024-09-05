import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnboardingWidget extends StatelessWidget {
  String imagePath;
  String text;
  OnboardingWidget({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/images/$imagePath',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 34),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
