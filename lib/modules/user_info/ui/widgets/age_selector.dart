import 'package:flutter/material.dart';

class AgeSelector extends StatelessWidget {
  final int currentIndex;
  final Function(int) onAgeSelect;
  const AgeSelector(
      {super.key, required this.currentIndex, required this.onAgeSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              (currentIndex + 1).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "years",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            )
          ],
        ),
        SizedBox(
          height: 200,
          child: RotatedBox(
            quarterTurns: 2, // Horizontal scrolling for the age picker
            child: ListWheelScrollView.useDelegate(
              itemExtent: 20,
              diameterRatio: 5,
              perspective: 0.01,
              onSelectedItemChanged: (index) {
                onAgeSelect(index);
              },
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return RotatedBox(
                    quarterTurns: -1, // Correct the inner elements' rotation
                    child: Container(
                        width: 60,
                        height: currentIndex == index
                            ? 120
                            : index % 5 == 0
                                ? 72
                                : 50,
                        alignment: Alignment.center,
                        child: Container(
                          width: 4,
                          color: const Color(0xFFD0FD3E),
                        )),
                  );
                },
                childCount: 100, // Adjust this to the age range (e.g., 0-99)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
