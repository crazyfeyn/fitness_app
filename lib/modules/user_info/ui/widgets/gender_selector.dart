import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class GenderSelector extends StatelessWidget {
  final bool isMale;
  final Function(bool) onGenderSelected;

  const GenderSelector({
    super.key,
    required this.isMale,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onGenderSelected(true);
          },
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: isMale ? const Color(0xFFD0FD3E) : const Color(0xFF2C2C2E),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.male,
                  size: 68,
                  color: isMale ? Colors.black : Colors.white,
                ),
                Text(
                  AppLocalizations.of(context)!.male, // Use localized string
                  style: TextStyle(
                    fontSize: 15,
                    color: isMale ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 44),
        GestureDetector(
          onTap: () {
            onGenderSelected(false); // Set to Female
          },
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: isMale ? const Color(0xFF2C2C2E) : const Color(0xFFD0FD3E),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.female,
                  size: 68,
                  color: isMale ? Colors.white : Colors.black,
                ),
                Text(
                  AppLocalizations.of(context)!.female, // Use localized string
                  style: TextStyle(
                    fontSize: 15,
                    color: isMale ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
