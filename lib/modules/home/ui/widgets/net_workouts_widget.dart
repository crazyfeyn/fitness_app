import 'package:flutter/material.dart';
import 'package:flutter_application/l10n/l10n.dart';

class NetWorkoutsWidget extends StatelessWidget {
  final String imageUrl;
  final String titleKey; // Change to a key for localization
  final String subtitleKey; // Change to a key for localization
  final int rangeNumber;

  const NetWorkoutsWidget({
    super.key,
    required this.imageUrl,
    required this.titleKey, // Use titleKey for localization
    required this.subtitleKey, // Use subtitleKey for localization
    required this.rangeNumber,
  });

  @override
  Widget build(BuildContext context) {
    // Access localized strings using the localization method or package
    final localizations = Localizations.of(context, L10n); // Replace with your localization class

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/workoutScreen',
        arguments: {'rangeNumber': rangeNumber},
      ),
      child: Row(
        children: [
          Container(
            width: 200,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/$imageUrl"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Use localized title
                Text(
                  localizations?.translate(titleKey) ?? titleKey, // Replace with your localization method
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                // Use localized subtitle
                Text(
                  localizations?.translate(subtitleKey) ?? subtitleKey, // Replace with your localization method
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffD0FD3E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
