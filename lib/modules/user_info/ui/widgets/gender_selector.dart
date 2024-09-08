import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final bool isMale;
  final Function(bool) onGenderSelected;

  const GenderSelector({
    Key? key,
    required this.isMale,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onGenderSelected(true); // Set to Male
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
                  "Male",
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
                  "Female",
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
