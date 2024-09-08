import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeightSelector extends StatelessWidget {
  int currentIndex;
  final Function(int) onHeightSelected;
  HeightSelector(
      {super.key, required this.currentIndex, required this.onHeightSelected});

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
              "sm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            )
          ],
        ),
        SizedBox(
          height: 280,
          child: RotatedBox(
            quarterTurns: 2, 
            child: ListWheelScrollView.useDelegate(
              itemExtent: 20,
              diameterRatio: 5,
              perspective: 0.01,
              onSelectedItemChanged: (index) {
                onHeightSelected(index);
              },
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return RotatedBox(
                    quarterTurns: -1,
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
                childCount: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
